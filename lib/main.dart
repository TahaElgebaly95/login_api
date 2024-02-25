import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/view/auth_screen/login_screen.dart';
import 'package:login_api/view/auth_screen/register_screen.dart';
import 'package:login_api/view/task_screen/task_screen.dart';
import 'package:login_api/view_model/components/themes/dark_theme.dart';
import 'package:login_api/view_model/components/themes/light_theme.dart';
import 'package:login_api/view_model/cubit/auth_cubit/cubit.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:login_api/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:login_api/view_model/cubit/theme_cubit/theme_state.dart';
import 'core/data/local/shared_helper.dart';
import 'core/data/local/shared_keys.dart';
import 'core/data/network/helper/bloc_observer.dart';
import 'core/data/network/helper/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedHelper.init();
  DioHelper.init();
  await SharedHelper.clear();
  String? token = await SharedHelper.get(key: SharedKey.token);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          var cubit = ThemeCubit.get(context);
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
           // home: token == null ? const LoginScreen() : const TaskScreen(),
                home: const RegisterScreen(),
          );
        },
      ),
    ),
  );
}

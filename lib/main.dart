import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/data/local/shared_helper.dart';
import 'package:login_api/view/login_screen.dart';
import 'package:login_api/view_model/cubit/login_cubit/cubit.dart';
import 'data/network/helper/bloc_observer.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
Bloc.observer=MyBlocObserver();
SharedHelper.init();
  runApp(BlocProvider(
    create: (context) => LoginCubit(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  ));
}

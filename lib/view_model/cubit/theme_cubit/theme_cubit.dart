import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/view_model/cubit/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit() : super(ThemeState());

 static ThemeCubit get(context)=> BlocProvider.of<ThemeCubit>(context);

  bool isDark=false;
  void changeThemeCubit (){
    isDark = !isDark;
    emit(ChangeThemeState());
  }
}
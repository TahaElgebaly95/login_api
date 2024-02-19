import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/data/network/helper/dio_helper.dart';
import 'package:login_api/data/network/helper/endpoints.dart';
import 'package:login_api/view_model/cubit/login_cubit/state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitLogin());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> Login() async {
    await DioHelper.post(endpoint: EndPonits.login, body: {
      'email': emailController.text,
      'password': passwordController.text},);
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/view_model/cubit/auth_cubit/state.dart';
import '../../../core/data/local/shared_helper.dart';
import '../../../core/data/local/shared_keys.dart';
import '../../../core/data/network/helper/dio_helper.dart';
import '../../../core/data/network/helper/endpoints.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitLogin());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController namedController = TextEditingController();
  TextEditingController emilaRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  TextEditingController conPasswordRegisterController = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoadingLoginState());
    await DioHelper.post(
      endpoint: EndPonits.login,
      body: {
        'email': emailController.text,
        'password': passwordController.text
      },
    ).then((value) async {
      print(value.data['data']['token']);
      await SharedHelper.set(
          key: SharedKey.token, value: value.data['data']['token']);
      await SharedHelper.set(
          key: SharedKey.userID, value: value.data['data']['user']['id']);
      await SharedHelper.set(
          key: SharedKey.userName, value: value.data['data']['user']['name']);
      await SharedHelper.set(
          key: SharedKey.userEmail, value: value.data['data']['user']['email']);
      emit(SuccessLoginState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
        emit(ErrorLoginState());
        throw onError;
      }
    });
  }
  Future<void> register ()async {
    emit(LoadingRegisterState());
    final Response response = await DioHelper.post(endpoint: EndPonits.register,body: {
      "name":namedController.text,
      "email":emilaRegisterController.text,
      "password":passwordRegisterController.text,
      "password_confirmation":conPasswordRegisterController.text,
    });
    if (response.statusCode == 200) {
     SharedHelper.set(key: SharedKey.registerToken, value: response.data['data']['token']);
     SharedHelper.set(key: SharedKey.registerUserID, value: response.data['data']['user']['id']);
     SharedHelper.set(key: SharedKey.registerName, value: response.data['data']['user']['name']);
     SharedHelper.set(key: SharedKey.registerUserEmail, value: response.data['data']['user']['email']);
     emit(SuccessRegisterState());
    }else {
      emit(ErrorRegisterState(response.data['message']));
    }
  }
}


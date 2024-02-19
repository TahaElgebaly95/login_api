import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/utils/font_style.dart';
import 'package:login_api/utils/navigations.dart';
import 'package:login_api/view/register_screen.dart';
import 'package:login_api/view_model/components/textbutton_custom.dart';
import '../view_model/components/custom_textfield.dart';
import '../view_model/components/push_button.dart';
import '../view_model/cubit/login_cubit/cubit.dart';
import '../view_model/cubit/login_cubit/state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: AppFontStyle.titleStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return Column(
                children: [
                  CustomTextField(
                      customEditingController: cubit.emailController,
                      labelAndHint: 'email'),
                  const SizedBox(height: 12),
                  CustomTextField(
                      customEditingController: cubit.passwordController,
                      labelAndHint: 'Password'),
                  PushButton(
                    nameOfButton: 'Login',onPressed: (){},
                  ),
                  Row(
                    children: [
                      Text('Don\' have an account?   ',
                          style: AppFontStyle.descriptionStyle),
                      CustomButton(buttonName: 'Register',onPressed: () {
                        Navigation.push(context, const RegisterScreen());
                      },),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

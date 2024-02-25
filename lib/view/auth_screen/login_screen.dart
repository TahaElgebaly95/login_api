import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/view/auth_screen/register_screen.dart';
import 'package:login_api/view/task_screen/task_screen.dart';
import 'package:login_api/view_model/components/textbutton_custom.dart';
import 'package:login_api/view_model/cubit/auth_cubit/state.dart';
import '../../utils/font_style.dart';
import '../../utils/navigations.dart';
import '../../view_model/components/custom_textfield.dart';
import '../../view_model/components/push_button.dart';
import '../../view_model/cubit/auth_cubit/cubit.dart';

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
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SuccessLoginState) {
                Navigation.pushAndRemove(context, const TaskScreen());
              }
            },
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: cubit.loginKey,
                child: Column(
                  children: [
                    CustomTextField(
                        prefixIcon: const Icon(Icons.email),
                        onTap: () {},
                        validator: (value) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        customEditingController: cubit.emailController,
                        labelAndHint: 'email'),
                    const SizedBox(height: 12),
                    CustomTextField(
                        prefixIcon: const Icon(Icons.password),
                        onTap: () {},
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'please enter your password';
                          } else if (cubit.passwordController.text != value) {
                            return 'wrong password';
                          }
                          return null;
                        },
                        customEditingController: cubit.passwordController,
                        labelAndHint: 'Password'),
                    PushButton(
                      nameOfButton: const Text('Login'),
                      onPressed: () {
                        if (cubit.loginKey.currentState!.validate()) {
                          cubit.login();
                        }
                      },
                    ),
                    Row(
                      children: [
                        Text('Don\' have an account?   ',
                            style: AppFontStyle.descriptionStyle),
                        CustomButton(
                          buttonName: 'Register',
                          onPressed: () {
                            Navigation.push(context, const RegisterScreen());
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

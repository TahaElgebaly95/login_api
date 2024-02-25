import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/view_model/cubit/auth_cubit/cubit.dart';
import 'package:login_api/view_model/cubit/auth_cubit/state.dart';

import '../../utils/font_style.dart';
import '../../utils/navigations.dart';
import '../../view_model/components/custom_textfield.dart';
import '../../view_model/components/push_button.dart';
import '../../view_model/components/textbutton_custom.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          'Register',
          style: AppFontStyle.titleStyle,
        )),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SuccessRegisterState) {
              Navigation.pushAndRemove(context, const LoginScreen());
            }
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: cubit.registerKey,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    CustomTextField(
                        prefixIcon:const Icon(Icons.drive_file_rename_outline),
                        onTap: () {},
                        validator: (value) {
                          return null;
                        },
                        labelAndHint: 'name',
                        customEditingController: cubit.namedController),
                    const SizedBox(height: 12),
                    CustomTextField(
                        prefixIcon:const Icon(Icons.email),
                        onTap: () {},
                        validator: (value) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        customEditingController: cubit.emilaRegisterController,
                        labelAndHint: 'email'),
                    const SizedBox(height: 12),
                    CustomTextField(
                        prefixIcon:const Icon(Icons.password),
                        onTap: () {},
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'Enter your password';
                          } else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
                            return 'Password should has at least one uppercase letter';
                          } else if (!RegExp(r'[!@#\\$%^&*(),.?":{}|<>]')
                              .hasMatch(value)) {
                            return 'Password should has special character';
                          } else if (!RegExp(r'[1-9]').hasMatch(value)) {
                            return 'password should has one number at least';
                          } else if ((value.length ?? 0) < 8) {
                            return 'Password can\'t be less than 8 Characters';
                          }
                          return null;
                        },
                        customEditingController:
                            cubit.passwordRegisterController,
                        labelAndHint: 'Password'),
                    const SizedBox(height: 12),
                    CustomTextField(
                        prefixIcon:const Icon(Icons.password),
                        onTap: () {},
                        validator: (value) {
                          if ((value??'').isEmpty){
                            return 'please enter your confirm password';
                          }else if (cubit.passwordRegisterController.text != value ){
                            return 'confirm password must be the same password';
                          }
                          return null;
                        },
                        labelAndHint: 'Confirm Password',
                        customEditingController:
                            cubit.conPasswordRegisterController),
                    PushButton(
                      nameOfButton: state is LoadingRegisterState ? const CircularProgressIndicator():const Text('Register'),
                      onPressed: () {
                        if (cubit.registerKey.currentState!.validate()) {
                          cubit.register();
                        }
                      },
                    ),
                    Row(
                      children: [
                        Text('Already have an account?   ',
                            style: AppFontStyle.descriptionStyle),
                        CustomButton(
                          buttonName: 'Login',
                          onPressed: () {
                            Navigation.pushAndRemove(context, const LoginScreen());

                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

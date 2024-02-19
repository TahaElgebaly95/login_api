import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/font_style.dart';
import '../utils/navigations.dart';
import '../view_model/components/custom_textfield.dart';
import '../view_model/components/push_button.dart';
import '../view_model/components/textbutton_custom.dart';
import '../view_model/cubit/login_cubit/cubit.dart';
import '../view_model/cubit/login_cubit/state.dart';

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
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  CustomTextField(
                      labelAndHint: 'name',
                      customEditingController: cubit.emailController),
                  const SizedBox(height: 12),
                  CustomTextField(
                      customEditingController: cubit.emailController,
                      labelAndHint: 'email'),
                  const SizedBox(height: 12),
                  CustomTextField(
                      customEditingController: cubit.passwordController,
                      labelAndHint: 'Password'),
                  const SizedBox(height: 12),
                  CustomTextField(
                      labelAndHint: 'Confirm Password',
                      customEditingController: cubit.passwordController),
                  PushButton(
                    nameOfButton: 'Register',
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      Text('Already have an account?   ',
                          style: AppFontStyle.descriptionStyle),
                      CustomButton(
                        buttonName: 'Login',
                        onPressed: () {
                          Navigation.pop(context);
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
    );
  }
}

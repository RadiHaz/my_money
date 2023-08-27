import 'package:flutter/material.dart';
import 'package:my_money/src/modules/login/components/my_text_form_field.dart';
import 'package:my_money/src/router/app_router.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_logo_title.dart';
import 'package:my_money/src/shared/components/custom_container.dart';
import 'package:my_money/src/shared/helpers/utils.dart';

import '../../../shared/components/app_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController = TextEditingController(text: '');
  var nameController = TextEditingController(text: '');
  var passwordController = TextEditingController(text: '');
  var confirmPasswordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final screenHeight = Utils().getScreenHeight(context);
    bool val = true;
    return Scaffold(
      backgroundColor: AppColors.appPageBackground,
      body: SingleChildScrollView(
        child: CustomContainer(
          gradientStartColor: AppColors.initialPageBackground,
          gradientEndColor: AppColors.inputBackground,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.logo,
                    onPressed: () => Navigator.pop(context),
                    alignment: Alignment.centerLeft,
                  )
                ],
              ),
              const AppLogoTitle(
                title: 'Sign Up',
                iconSize: 80,
                titleSize: 40,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(labelText: 'Name', controller: nameController),
              const SizedBox(
                height: 10,
              ),
              MyTextFormField(labelText: 'E-mail', controller: emailController),
              const SizedBox(
                height: 10,
              ),
              MyTextFormField(
                labelText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextFormField(
                  labelText: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: val,
                    onChanged: (boolean) => {
                      setState(() {
                        val = !val;
                      })
                    },
                    activeColor: AppColors.logo,
                  ),
                  const Text('I have read and agreed with the ', style: TextStyle(color: AppColors.mainText),),
                  const Text('Terms of Use', style: TextStyle(color: AppColors.logo),)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AppButton(
                label: 'Register',
                action: () {
                  Navigator.pushReplacementNamed(context, AppRouter.login);
                },
              ),
              SizedBox(
                height: screenHeight * 0.025,
              )
            ],
          ),
        ),
      ),
    );
  }
}

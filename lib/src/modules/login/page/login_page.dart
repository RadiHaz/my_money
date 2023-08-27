import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/src/modules/finances/page/personal_data.dart';
import 'package:my_money/src/modules/login/components/button_tile.dart';
import 'package:my_money/src/modules/login/components/my_text_form_field.dart';
import 'package:my_money/src/modules/login/components/register_link.dart';
import 'package:my_money/src/router/app_router.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_button.dart';
import 'package:my_money/src/shared/components/app_loading.dart';
import 'package:my_money/src/shared/components/app_logo_title.dart';
import 'package:my_money/src/shared/components/custom_container.dart';
import 'package:my_money/src/shared/helpers/utils.dart';

import '../../register/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  _defineLayout(double screenWidth, double screenHeight) {
    //if isSmallScreen buttonDirection = Column
    // else buttonDirection = Row
    var colChildren = [
      const ButtonTile(imagePath: 'lib/images/google.png'),
      SizedBox(
        height: screenHeight * 0.025,
      ),
      const ButtonTile(
        imagePath: 'lib/images/apple.png',
      )
    ];

    var rowChildren = [
      const ButtonTile(imagePath: 'lib/images/google.png'),
      SizedBox(
        width: screenWidth * 0.05,
      ),
      const ButtonTile(
        imagePath: 'lib/images/apple.png',
      )
    ];

    var columnLayout = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colChildren,
    );
    var rowLayout = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren,
    );

    log('$screenWidth');
    return screenWidth < 280 ? columnLayout : rowLayout;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils().getScreenHeight(context);
    double screenWidth = Utils().getScreenWidth(context);

    return isLoading
        ? const Center(child: AppLoading())
        : Scaffold(
            backgroundColor: AppColors.appPageBackground,
            body: SingleChildScrollView(
              child: CustomContainer(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const AppLogoTitle(
                      title: 'My Money',
                      iconSize: 80,
                      titleSize: 40,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MyTextFormField(
                        labelText: 'Username',
                        controller: loginController,
                        focus: true),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppButton(action: () {}, label: "Login"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Or continue with',
                      style: TextStyle(
                          fontSize: 18, color: AppColors.secondaryText),
                    ),
                    SizedBox(
                      height: screenHeight * 0.025,
                    ),
                    _defineLayout(screenWidth, screenHeight),
                    SizedBox(
                      height: screenHeight * 0.025,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                        child: const RegisterLink()),
                    SizedBox(
                      height: screenHeight * 0.025,
                    )
                    //row (Google, Apple)
                  ])),
            ),
          );
  }
}

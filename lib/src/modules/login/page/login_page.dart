import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/src/modules/login/components/button_tile.dart';
import 'package:my_money/src/modules/login/components/my_text_form_field.dart';
import 'package:my_money/src/modules/login/components/register_link.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_button.dart';
import 'package:my_money/src/shared/components/app_loading.dart';
import 'package:my_money/src/shared/components/app_logo_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = true;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
    ).then((_) => setState(() {
          isLoading = !isLoading;
        }));
  }

  _defineLayout() {
    //if isSmallScreen buttonDirection = Column
    // else buttonDirection = Row
    const colChildren = [
      ButtonTile(imagePath: 'lib/images/google.png'),
      SizedBox(
        height: 35,
      ),
      ButtonTile(
        imagePath: 'lib/images/apple.png',
      )
    ];

    const rowChildren = [
      ButtonTile(imagePath: 'lib/images/google.png'),
      SizedBox(
        width: 35,
      ),
      ButtonTile(
        imagePath: 'lib/images/apple.png',
      )
    ];

    const columnLayout = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colChildren,
    );
    const rowLayout = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren,
    );

    log('$_screenWidth');
    return _screenWidth < 280 ? columnLayout : rowLayout;
  }

  @override
  Widget build(BuildContext context) {
    // get screenWidth
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    _screenWidth = screenWidth;
    _screenHeight = screenHeight;

    bool isSmallScreen = screenWidth <= 360;
    bool isMediumScreen = screenWidth > 360 && screenWidth < 768;
    bool isLargeScreen = screenWidth >= 768;

    // resolve final width to make it dynamic based on screen size
    // screenWidth * 0.8 = 80% of screen's width :)
    //* 0.5 : screenWidth * 0.8
    //screenWidth
    double resolvedWidth = isSmallScreen
        ? (screenWidth * 0.8)
        : (isMediumScreen
            ? (screenWidth * 0.7)
            : (isLargeScreen ? screenWidth * 0.6 : screenWidth * 0.8));

    return isLoading
        ? const Center(child: AppLoading())
        : Scaffold(
            backgroundColor: AppColors.appPageBackground,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: SizedBox(
                width: screenWidth,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.025,
                    ),
                    child: SizedBox(
                      width: resolvedWidth,
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AppButton(
                                action: () => isLoading = !isLoading,
                                label: "Login"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Or continue with',
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.secondaryText),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            _defineLayout(),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                                onTap: () {}, child: const RegisterLink()),
                            const SizedBox(
                              height: 25,
                            )
                            //row (Google, Apple)
                          ]),
                    ),
                  ),
                ),
              )),
            ),
          );
  }
}

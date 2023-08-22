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
    var colChildren = [
      const ButtonTile(imagePath: 'lib/images/google.png'),
      SizedBox(
        height: _screenHeight * 0.025,
      ),
      const ButtonTile(
        imagePath: 'lib/images/apple.png',
      )
    ];

    var rowChildren = [
      const ButtonTile(imagePath: 'lib/images/google.png'),
      SizedBox(
        width: _screenWidth * 0.05,
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


    bool isSmallHeight = screenHeight <= 680;
    bool isMediumHeight = screenHeight > 680 && screenHeight <= 800;
    bool isLargeHeight = screenHeight > 800;

    double resolvedHeight = isSmallHeight
        ? (screenHeight * 0.1)
        : (isMediumHeight
            ? (screenHeight * 0.25)
            : (isLargeHeight ? screenHeight * 0.7 : screenHeight * 0.2));

    return isLoading
        ? const Center(child: AppLoading())
        : Scaffold(
            backgroundColor: AppColors.appPageBackground,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: resolvedWidth - (resolvedWidth * .925),
                      right: resolvedWidth - (resolvedWidth * .925),
                      top: (resolvedHeight * .2),
                  ),

                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        shape: BoxShape.rectangle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.inputBackground,
                            AppColors.initialPageBackground
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.containerShadow,
                              spreadRadius: 1,
                              blurRadius: 25,
                              offset: Offset(2.5, 15))
                        ]),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: _screenHeight * 0.025,
                            left: resolvedWidth - (resolvedWidth * 0.9),
                            right: resolvedWidth - (resolvedWidth * 0.9)),
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
                                AppButton(
                                    action: () {},
                                    label: "Login"),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Or continue with',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.secondaryText),
                                ),
                                SizedBox(
                                  height: _screenHeight * 0.025,
                                ),
                                _defineLayout(),
                                SizedBox(
                                  height: _screenHeight * 0.025,
                                ),
                                GestureDetector(
                                    onTap: () {}, child: const RegisterLink()),
                                SizedBox(
                                  height: _screenHeight * 0.025,
                                )
                                //row (Google, Apple)
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
            ),
          );
  }
}

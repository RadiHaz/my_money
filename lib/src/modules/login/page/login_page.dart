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

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
    ).then((_) => setState(() {
          isLoading = !isLoading;
        }));
  }

  @override
  Widget build(BuildContext context) {
    // get screenWidth
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSmallScreen = screenWidth < 720;
    bool isMediumScreen = screenWidth >= 720 && screenWidth < 1280;
    bool isLargeScreen = screenWidth >= 1280;
    // resolve final width to make it dynamic based on screen size
    // screenWidth * 0.8 = 80% of screen's width :)
    //* 0.5 : screenWidth * 0.8
    //screenWidth
    double resolvedWidth =
    isSmallScreen ? (screenWidth * 0.4) :
        isMediumScreen ? (screenWidth * 0.7)
            : (isLargeScreen ? screenWidth * 0.6 : screenWidth * 0.5);

    return isLoading
        ? const Center(child: AppLoading())
        : Scaffold(
            backgroundColor: AppColors.appPageBackground,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 80,
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
                              Text('Forgot password?',
                                  style: TextStyle(
                                      color: AppColors.secondaryText)),
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonTile(imagePath: 'lib/images/google.png'),
                              SizedBox(
                                width: 35,
                              ),
                              ButtonTile(imagePath: 'lib/images/apple.png', width: screenWidth,)
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                              onTap: () {}, child: const RegisterLink()),
                          //row (Google, Apple)
                        ]),
                  ),
                ),
              )),
            ),
          );
  }
}

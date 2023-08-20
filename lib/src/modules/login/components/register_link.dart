import 'package:flutter/material.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';

class RegisterLink extends StatelessWidget {
  const RegisterLink({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            color: AppColors.secondaryText,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          'Sign up here',
          style: TextStyle(
            color: AppColors.logo,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ],
    );
  }
}

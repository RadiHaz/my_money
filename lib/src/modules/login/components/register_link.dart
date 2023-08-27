import 'package:flutter/material.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';

import '../../../shared/components/custom_container.dart';

class RegisterLink extends StatelessWidget {
  const RegisterLink({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            color: AppColors.secondaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Sign up here',
          style: TextStyle(
            color: AppColors.logo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

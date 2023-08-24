import 'package:flutter/material.dart';
import 'package:my_money/src/modules/login/components/my_text_form_field.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_logo_title.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var placeholder = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.appPageBackground,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )),
      backgroundColor: AppColors.appPageBackground,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppLogoTitle(
                  title: 'Sign Up',
                  titleSize: 20,
                  iconSize: 80,
                ),
                MyTextFormField(labelText: 'Name', controller: placeholder),
                MyTextFormField(labelText: 'E-mail', controller: placeholder),
                MyTextFormField(labelText: 'Password', controller: placeholder),
                MyTextFormField(labelText: 'Confirm Password', controller: placeholder),
                MyTextFormField(labelText: '', controller: placeholder),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

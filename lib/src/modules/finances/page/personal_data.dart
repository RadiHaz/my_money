import 'package:flutter/material.dart';
import 'package:my_money/src/modules/login/components/my_text_form_field.dart';
import 'package:my_money/src/shared/components/app_button.dart';
import 'package:my_money/src/shared/components/app_logo_title.dart';
import 'package:my_money/src/shared/helpers/utils.dart';

import '../../../shared/colors/app_colors.dart';
import '../../../shared/components/custom_container.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    TextEditingController placeholder = TextEditingController();
    double screenHeight = Utils().getScreenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.appPageBackground,
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Column(
            children: [
              Row(children: [IconButton(
                icon: const Icon(Icons.arrow_back),
                color: AppColors.logo,
                onPressed: () => Navigator.pop(context),
                alignment: Alignment.centerLeft,
              ),
              ],),
              const AppLogoTitle(
                title: 'Personal info',
                titleSize: 40,
                iconSize: 80,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(labelText: 'Username', controller: placeholder),
              const SizedBox(
                height: 10,
              ),
              MyTextFormField(labelText: 'Email', controller: placeholder),
              const SizedBox(
                height: 10,
              ),
              MyTextFormField(labelText: 'Password', controller: placeholder),
              const SizedBox(
                height: 30,
              ),
              AppButton(action: () {}, label: 'Confirm changes'),
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

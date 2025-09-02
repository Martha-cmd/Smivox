import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import '../../../commons/smivox_button.dart';
import '../../../commons/smivox_inapp_bar.dart';
import 'components/settings_custom_input.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomInAppBar(title: "Change Password"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Column(
              spacing: 30,
              children: [
                SettingsCustomInput(headText: "Current password", hintText: "Enter current password", hintStyle: TextStyle(color: AppColors.inactiveGrey),),
                SettingsCustomInput(headText: "New password", hintText: "Enter new password", hintStyle: TextStyle(color: AppColors.inactiveGrey),),
                SettingsCustomInput(headText: "Confirm new password", hintText: "Confirm new password", hintStyle: TextStyle(color: AppColors.inactiveGrey),),
              ],
            ),
            const SizedBox(height: 45),
            SmivoxButton(text: "Change Password", color: AppColors.inactiveInput),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

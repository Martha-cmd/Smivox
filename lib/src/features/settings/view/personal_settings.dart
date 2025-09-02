import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../commons/common_methods.dart';
import '../../../commons/smivox_button.dart';
import '../../../commons/smivox_inapp_bar.dart';
import 'components/settings_custom_input.dart';

class PersonalSettings extends StatefulWidget {
  const PersonalSettings({super.key});

  @override
  State<PersonalSettings> createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomInAppBar(title: "Personal Settings"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRect(
                    child: Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Color(0xFF656565)
                      ),
                      child: Center(
                        child: SvgPicture.asset("assets/svgs/user.svg")
                      ),
                    )
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: SvgPicture.asset("assets/svgs/edit.svg")),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              spacing: 24,
              children: [
                SettingsCustomInput(headText: "Name", hintText: "Paul"),
                SettingsCustomInput(headText: "Last name", hintText: "Timothy"),
                SettingsCustomInput(headText: "Email", hintText: "paultimothy@gmail.com"),
                SettingsCustomInput(headText: "Phone Number", hintText: "+234 567 123 5678"),
              ],
            ),
            const SizedBox(height: 40),
            SmivoxButton(text: "Save Changes"),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

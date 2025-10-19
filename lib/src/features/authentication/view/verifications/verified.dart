import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/core/storage/storage_manager.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import '../../components/heading_and_subheading.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                CommonMethods.appTexts(
                  context,
                  "Congratulations!",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                Image.asset("assets/images/Frame 27.png"),
                const SizedBox(height: 10),
                HeadingAndSubheading(
                    heading: "You're all set",
                    subHeading: "Smart move, now let’s turn your inventory into a theft proof powerhouse",
                   letterSpacing: 0.5,
                   subHeadingColor: Colors.black,
                   fontSize: 16,
                ),
                SizedBox(height: 10),
                SmivoxButton(
                    text: "Launch Dashboard",
                    onTap: () async {
                      await StorageManager.setCurrentStep("/dashboard");
                      CommonMethods.sendToNextScreen(context, RoutesPath.bottomBar);
                    }
                )
              ],
            ),
          )
      ),
    );
  }
}

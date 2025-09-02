import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import 'components/settings_custom_input.dart';


class StoreSettings extends StatefulWidget {
  const StoreSettings({super.key});

  @override
  State<StoreSettings> createState() => _StoreSettingsState();
}

class _StoreSettingsState extends State<StoreSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInAppBar(title: "Store Settings"),
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
                             child: CommonMethods.appTexts(
                                 context,
                                 "LOGO",
                                 fontSize: 16,
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold
                             ),
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
                     SettingsCustomInput(headText: "Name", hintText: "Retail Store Name"),
                     SettingsCustomInput(headText: "Category", hintText: "Retail Store"),
                     SettingsCustomInput(headText: "Email", hintText: "retailatore@gmail.com"),
                     SettingsCustomInput(headText: "Phone Number", hintText: "+234 567 123 5678"),
                     SettingsCustomInput(headText: "Currency", hintText: "NGN"),
                     SettingsCustomInput(headText: "Address", hintText: "Beloview Estate, Ikoyi"),
                     SettingsCustomInput(headText: "City", hintText: "Ikoyi"),
                     SettingsCustomInput(headText: "State", hintText: "Lagos State"),
                     SettingsCustomInput(headText: "Country", hintText: "Nigeria"),
                   ],
                ),
               const SizedBox(height: 32),
               SmivoxButton(text: "Save Changes"),
               const SizedBox(height: 32),
             ],
          ),
        ),
    );
  }
}




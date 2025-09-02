import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';

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
        body: Column(
           children: [

           ],
        ),
    );
  }
}

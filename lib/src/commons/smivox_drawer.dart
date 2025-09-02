import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/add_product_dialog.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import 'app_colors.dart';
import 'common_methods.dart';

class SmivoxDrawer extends StatefulWidget {
  const SmivoxDrawer({super.key});

  @override
  State<SmivoxDrawer> createState() => _SmivoxDrawerState();
}

class _SmivoxDrawerState extends State<SmivoxDrawer> {
  bool _isSettingsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 111,
            decoration: BoxDecoration(
              color: Color(0xFFFFD3BD),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo/logo.png",
                      fit: BoxFit.contain,
                      width: 100,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, size: 16,))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: SvgPicture.asset("assets/drawer/warehouse.svg", width: 20),
            title: CommonMethods.appTexts(context, "Add Products"),
            onTap: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                        return AddProductDialog(
                            onSubmit: (category, labelStatus, price, manufacturer, brand, date) {
                              print("Product Added: $category, $labelStatus");
                            }
                        );
                    }
                );
            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/drawer/packaging-add.svg", width: 20),
            title: CommonMethods.appTexts(context, "Add Categories"),
          ),
          ListTile(
            leading: SvgPicture.asset("assets/drawer/user-circle.svg", width: 20),
            title: CommonMethods.appTexts(context, "Customers"),
            onTap: () {
                CommonMethods.sendToNextScreen(context, RoutesPath.customerView);
            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/drawer/user-polygon.svg", width: 20),
            title: CommonMethods.appTexts(context, "Staff"),
            onTap: () {
              CommonMethods.sendToNextScreen(context, RoutesPath.staffView);
            },
          ),
          // ListTile(
          //   leading: SvgPicture.asset("assets/drawer/setting.svg", width: 20),
          //   title: CommonMethods.appTexts(context, "Settings"),
          // ),
          // Settings with dropdown
          Column(
            children: [
              ListTile(
                leading: SvgPicture.asset("assets/drawer/setting.svg", width: 20),
                title: CommonMethods.appTexts(context, "Settings"),
                trailing: Icon(
                  _isSettingsExpanded ? Icons.expand_less : Icons.expand_more,
                  size: 25,
                  color: AppColors.primary,
                ),
                onTap: () {
                  setState(() {
                    _isSettingsExpanded = !_isSettingsExpanded;
                  });
                },
              ),
              if (_isSettingsExpanded) ...[
                // Store Settings
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: CommonMethods.appTexts(
                      context,
                      "Store Settings",
                      fontSize: 16,
                    ),
                    onTap: () {
                      CommonMethods.sendToNextScreen(context, RoutesPath.storeSettings);
                    },
                  ),
                ),
                // Personal Settings
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: CommonMethods.appTexts(
                      context,
                      "Personal Settings",
                      fontSize: 16,
                    ),
                    onTap: () {
                      CommonMethods.sendToNextScreen(context, RoutesPath.personalSettings);
                    },
                  ),
                ),
                // Change Password
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: CommonMethods.appTexts(
                      context,
                      "Change Password",
                      fontSize: 16,
                    ),
                    onTap: () {
                      CommonMethods.sendToNextScreen(context, RoutesPath.changePassword);
                    },
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ],
          ),
          ListTile(
            leading: SvgPicture.asset("assets/drawer/bar chart.svg", width: 20),
            title: CommonMethods.appTexts(context, "Reports"),
          ),
          ListTile(
            leading: SvgPicture.asset("assets/drawer/logout 01.svg", width: 20),
            title: CommonMethods.appTexts(context, "Log out", color: AppColors.error, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

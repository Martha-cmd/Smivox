import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_app_bar.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/features/POS/view/pos_screen.dart';
import 'package:smivox_inventory_software/src/features/home/view/home.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/inventory_screen.dart';
import 'package:smivox_inventory_software/src/features/sales/view/sales_screen.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import '../../commons/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<Widget> _pages = <Widget>[
       HomeScreen(),
       POS(),
       InventoryScreen(),
       SalesScreen(),
  ];

  void _onItemTapped(index) {
     setState(() {
       _selectedIndex = index;
     });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFECECEC),
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      endDrawer: _buildCustomDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildCustomBottomBar(context),
    );

  }
    
    Widget _buildCustomBottomBar(
        BuildContext context,
        // int selectedIndex
        ) {
      
      return Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
              ),
            color: Colors.white,
            boxShadow: [
               BoxShadow(
                 color: Colors.black.withOpacity(0.06),
                 blurRadius: 10,
                 offset: const Offset(0, -5),
               ),
            ]
          ),
         child: BottomNavigationBar(
           type: BottomNavigationBarType.fixed,
           currentIndex: _selectedIndex,
           onTap: _onItemTapped,
           selectedItemColor: AppColors.primary,
           unselectedItemColor: AppColors.darkGrey,
           backgroundColor: Colors.transparent,
           elevation: 0,
           selectedFontSize: 12,
           unselectedFontSize: 12,
           items: [
             _buildNavItem(
                 "assets/svgs/store.svg", AppTexts.home, 0, _selectedIndex),
             _buildNavItem(
                 "assets/svgs/trolley.svg", AppTexts.pos, 1, _selectedIndex),
             _buildNavItem(
                 "assets/svgs/package-box.svg", AppTexts.inventory, 2, _selectedIndex),
             _buildNavItem(
                 "assets/svgs/notes-edit.svg", AppTexts.sales, 3, _selectedIndex),
           ],
         ),
      );
  }

  BottomNavigationBarItem _buildNavItem(
      String iconPath, String label, int index, int selectedIndex,
      ) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
          height: 24,
          width: 24,
          child: Stack(clipBehavior: Clip.none, children: [
            SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
              color: selectedIndex == index
                  ? AppColors.primary
                  : AppColors.inactiveInput,
            ),
          ]),
        ),
      ),
      label: label,
    );
  }

  Widget _buildCustomDrawer() {
     return Drawer(
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
             ),
             ListTile(
                leading: SvgPicture.asset("assets/drawer/packaging-add.svg", width: 20),
               title: CommonMethods.appTexts(context, "Add Categories"),
             ),
             ListTile(
                leading: SvgPicture.asset("assets/drawer/user-circle.svg", width: 20),
               title: CommonMethods.appTexts(context, "Customers"),
             ),
             ListTile(
                leading: SvgPicture.asset("assets/drawer/user-polygon.svg", width: 20),
               title: CommonMethods.appTexts(context, "Staff"),
             ),
             ListTile(
                leading: SvgPicture.asset("assets/drawer/setting.svg", width: 20),
               title: CommonMethods.appTexts(context, "Settings"),
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

import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_app_bar.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_drawer.dart';
import 'package:smivox_inventory_software/src/features/POS/view/pos_screen.dart';
import 'package:smivox_inventory_software/src/features/SUPERVISOR/screens/home/view/home.dart';
import 'package:smivox_inventory_software/src/features/home/view/home.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/inventory_screen.dart';
import 'package:smivox_inventory_software/src/features/sales/view/sales_screen.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../commons/app_colors.dart';

class SupervisorBottomBar extends StatefulWidget {
  const SupervisorBottomBar({super.key});

  @override
  State<SupervisorBottomBar> createState() => _SupervisorBottomBarState();
}

class _SupervisorBottomBarState extends State<SupervisorBottomBar> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<Widget> _pages = <Widget>[
       SupervisorHomeScreen(),
       POS(),
       InventoryScreen(),
       // EmptyScreen(),
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
      backgroundColor: AppColors.mainBackground,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      endDrawer: SmivoxDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildCustomSupervisorBottomBar(context),
    );

  }
    
    Widget _buildCustomSupervisorBottomBar(
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
}

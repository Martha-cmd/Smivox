import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button_with_icon.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';
import 'package:smivox_inventory_software/src/commons/smivox_search_bar.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/single_category_dialog.dart';
import '../../../commons/common_methods.dart';
import 'add_category_dialog.dart';

class CategoryItem {
  final String categoryName;
  final String categoryNo;

  CategoryItem({
    required this.categoryName,
    required this.categoryNo,
  });
}

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final List<CategoryItem> categoryItems = [
    CategoryItem(
      categoryName: 'A list products ',
      categoryNo: '2000',
    ),
    CategoryItem(
      categoryName: 'Swallows ',
      categoryNo: '2000',
    ),
    CategoryItem(
      categoryName: 'Drinks ',
      categoryNo: '2000',
    ),
    CategoryItem(
      categoryName: 'Baked Foods ',
      categoryNo: '2000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomInAppBar(title: "Categories"),
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
          child: Column(
             children: [
                 Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                             SmivoxButtonWithIcon(
                                 widget: Icon(Icons.add, color: Colors.white),
                                 text: 'New',
                               onTap: () {
                                   showDialog(
                                       context: context,
                                       builder: (context) {
                                            return AddCategoryDialog();
                                       }
                                   );
                               }
                             ),
                             const SizedBox(height: 20),
                             SmivoxSearchBar(hintText: "Search category"),
                        ],
                   ),
                 ),

               ListView.separated(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: categoryItems.length,
                 separatorBuilder: (context, index) => const SizedBox(height: 8,),
                 itemBuilder: (context, index) {
                   final item = categoryItems[index];
                   final backgroundColor = index % 2 == 0
                       ? Colors.white
                       : Color(0xFFC2C2C2).withOpacity(0.1);
                   return GestureDetector(
                     onTap: () {
                       showDialog(
                           context: context,
                           builder: (context) {
                              return SingleCategoryDialog();
                           }
                       );
                     },
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       color: backgroundColor,
                       child: Padding(
                         padding: const EdgeInsets.symmetric(
                           vertical: 16,
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             /// Number badge
                            CommonMethods.appTexts(
                              context,
                              '${index + 01}',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(width: 40),

                            /// Product
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonMethods.appTexts(
                                        context,
                                        item.categoryName,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[800],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      CommonMethods.appTexts(
                                        context,
                                        'Inventory: ${item.categoryNo} products',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  ),

                                   // Sales Date
                                   SvgPicture.asset("assets/svgs/more_icon.svg", width: 24,),
                                ],
                              ),
                            ),
                           ],
                         ),
                       ),
                     ),
                   );
                 },
               ),
             ],
          ),
       ),
    );
  }
}

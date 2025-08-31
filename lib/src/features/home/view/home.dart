import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_page_title.dart';
import 'package:smivox_inventory_software/src/features/home/components/home_page_subheads.dart';
import '../../../commons/app_colors.dart';
import '../components/dashboard_components.dart';
import '../components/home_graph.dart';
import '../components/quick_actions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmivoxPageTitle(
                  pageTitle: "Hello Paul Ayomide",
                  pageIcon: Icon(Icons.notifications_outlined),
                ),

                CommonMethods.appTexts(
                  context,
                  "Admin",
                  color: AppColors.inactiveGrey,
                ),

                const SizedBox(height: 24),
                HomePageSubheads(
                  subtext: "Daily Overview",
                  subWidget: Icon(Icons.keyboard_arrow_down),
                ),

                const SizedBox(height: 16),
                DashboardStatistics(),

                const SizedBox(height: 32),
                HomePageSubheads(
                  subtext: "Revenue Analysis",
                  subWidget: Row(
                    children: [
                      CommonMethods.appTexts(context, "Yearly", fontSize: 12),
                      Icon(Icons.keyboard_arrow_down, size: 18),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                HomeGraph(),

                const SizedBox(height: 32),
                HomePageSubheads(subtext: "Quick Actions"),

                const SizedBox(height: 16),
                QuickActions(),

                const SizedBox(height: 32),
                HomePageSubheads(
                  subtext: "Top 5 selling products",
                  subWidget: CommonMethods.appTexts(
                    context,
                    "July",
                    color: AppColors.inactiveGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          TopSellingProductsTable(),
        ],
      ),
    );
  }
}

class ProductSales {
  final String productName;
  final int salesCount;

  ProductSales({required this.productName, required this.salesCount});
}

class TopSellingProductsTable extends StatelessWidget {
  final List<ProductSales> products = [
    ProductSales(productName: 'Hans Poundo Potato', salesCount: 5000000),
    ProductSales(productName: 'Product 2', salesCount: 4500000),
    ProductSales(productName: 'Product 3', salesCount: 4000000),
    ProductSales(productName: 'Product 4', salesCount: 3500000),
    ProductSales(productName: 'Product 5', salesCount: 3000000),
  ];

  TopSellingProductsTable({super.key});

  String formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Table Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonMethods.appTexts(
                  context,
                  'Products',
                  fontSize: 14,
                  color: AppColors.inactiveGrey
                ),
                CommonMethods.appTexts(
                    context,
                    'No of Sales',
                  fontSize: 14,
                  color: AppColors.inactiveGrey
                ),
              ],
            ),
          ),
          Divider(color: Color(0xFFD9D9D9), thickness: 0.5,),
          const SizedBox(height: 8),

          /// Table Rows
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            // separatorBuilder: (context, index) => const SizedBox(height: 8),
            separatorBuilder: (context, index) => const Divider(color: Color(0xFFD9D9D9), thickness: 0.5,),
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonMethods.appTexts(
                      context,
                      product.productName,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    CommonMethods.appTexts(
                      context,
                      formatNumber(product.salesCount),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
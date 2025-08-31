import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/features/sales/view/return_sales.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/common_methods.dart';
import '../../../commons/smivox_button_with_icon.dart';

class SingleSalesItem {
  final String productName;
  final String quantity;
  final String price;

  SingleSalesItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}

class SingleSalesTable extends StatelessWidget {
  final List<SingleSalesItem> salesItems = [
    SingleSalesItem(
      productName: 'Jumbo Cheese Balls',
      quantity: '2',
      price: '20,000',
    ),
    SingleSalesItem(
      productName: 'Hans Potato Poundo',
      quantity: 'Box',
      price: '20,000',
    ),
    SingleSalesItem(
      productName: 'Indomitables',
      quantity: 'Box',
      price: '20,000',
    ),
  ];

  SingleSalesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SmivoxButtonWithIcon(
                    text: "Print Receipt",
                    horPad: 5,
                    verPad: 8,
                    onTap:
                        () => CommonMethods.sendToNextScreen(
                          context,
                          RoutesPath.bottomBar,
                        ),
                  ),
                  const SizedBox(width: 10),
                  SmivoxButtonWithIcon(
                    bckgrndColor: Colors.transparent,
                    borderColor: AppColors.primary,
                    horPad: 5,
                    verPad: 8,
                    text: "Return items",
                    textColor: AppColors.primary,
                    onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                                return ReturnSales();
                            }
                        );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(
                  // vertical: 12,
                  horizontal: 10,
                ),
                child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CommonMethods.appTexts(
                          context,
                          "Products sold",
                            fontSize: 14,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CommonMethods.appTexts(
                          context,
                          "Qty",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CommonMethods.appTexts(
                          context,
                          "Price",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
              ),
              Divider(),

              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: salesItems.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final product = salesItems[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CommonMethods.appTexts(
                            context,
                            product.productName,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CommonMethods.appTexts(
                            context,
                            product.quantity,
                            fontSize: 14,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CommonMethods.appTexts(
                            context,
                            product.price,
                            fontSize: 14,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Total row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonMethods.appTexts(
                      context,
                      "Total:",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    CommonMethods.appTexts(
                      context,
                      "#108,000",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),

        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
               spacing: 32,
               children: [
                 CommonMethods.appTexts(
                      context,
                      "Other Sales Information",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                  ),
                 OtherSalesInfoWidget(info: "Staff", infoValue: "Miriram Chinelo"),
                 OtherSalesInfoWidget(info: "Customer", infoValue: "Adebayo Tim"),
                 OtherSalesInfoWidget(info: "Chanel", infoValue: "POS"),
                 OtherSalesInfoWidget(info: "Date", infoValue: "25-June-2025"),
                 OtherSalesInfoWidget(info: "Time", infoValue: "09-15 AM"),
                 OtherSalesInfoWidget(info: "Status", infoValue: "Successful", infoValueColor: Colors.blue,),
               ],
          ),
        ),

        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SmivoxButtonWithIcon(
            text: "Delete Sale",
            borderColor: AppColors.error,
            bckgrndColor: Colors.transparent,
            textColor: AppColors.error,
          ),
        ),

        const SizedBox(height: 40),
        

      ],
    );
  }
}

class OtherSalesInfoWidget extends StatelessWidget {
  final String info;
  final String infoValue;
  final Color? infoValueColor;

  const OtherSalesInfoWidget({super.key, required this.info, required this.infoValue, this.infoValueColor});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          flex: 2,
            child: CommonMethods.appTexts(
              context,
              info,
              color: AppColors.darkGrey,
            ),
        ),
        Expanded(
          flex: 2,
            child: CommonMethods.appTexts(
                context,
                infoValue,
                fontWeight: FontWeight.w500,
                color: infoValueColor ?? Colors.black
            ),
        )
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../commons/common_methods.dart';

class DashboardStatistics extends StatelessWidget {

  const DashboardStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Row(
          spacing: 24,
          children: [
            DashboardStatContainer(
              dashWidget:  Row(
                spacing: 5,
                children: [
                  CommonMethods.appTexts(
                    context,
                    "NGN",
                    fontSize: 10,
                    color: Color(0xFF34A400),
                    fontWeight: FontWeight.w600,
                  ),
                  CommonMethods.appTexts(
                      context,
                      "4,528,089",
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                  ),

                ],
              ),
              widgetIcon: SvgPicture.asset("assets/home/coin.svg"),
              statText: 'Revenue',
            ),
            DashboardStatContainer(
              widgetIcon: SvgPicture.asset("assets/home/security.svg"),
              statNumber: '10',
              statText: 'Tamper Attempts',
            ),
          ],
        ),
        Row(
          spacing: 24,
          children: [
            DashboardStatContainer(
              widgetIcon: SvgPicture.asset("assets/home/package box 06.svg"),
              statNumber: '368,900',
              statText: 'Inventory',
            ),
            DashboardStatContainer(
              widgetIcon: SvgPicture.asset("assets/home/trolley 01.svg"),
              statNumber: '68,900',
              statText: 'No of Sales',
            ),
          ],
        )
      ],
    );
  }
}


class DashboardStatContainer extends StatelessWidget {
  final Widget widgetIcon;
  final String? statNumber;
  final String statText;
  final Widget? dashWidget;

  const DashboardStatContainer({
    super.key,
    this.statNumber,
    required this.statText,
    this.dashWidget,
    required this.widgetIcon
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        width: double.infinity,
        height: 165,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widgetIcon,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dashWidget ?? CommonMethods.appTexts(
                    context,
                    statNumber!,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                ),
                CommonMethods.appTexts(
                  context,
                  statText,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import '../../../commons/common_methods.dart';
import '../../../commons/smivox_button.dart';
import 'active_inactive_tab.dart';

class OnboardingComponent extends StatelessWidget {
  final String image;
  final String headText;
  final String subText;
  final int currentIndex;
  final int totalPages;
  final VoidCallback? onTap;
  final String? btnText;
  final String? skipOr;
  final VoidCallback? action;
  final double? spaceBtwImg;
  final bool hasIcon;

  const OnboardingComponent({
    super.key,
    required this.image,
    required this.headText,
    required this.subText,
    required this.currentIndex,
    required this.totalPages,
    this.btnText,
    this.onTap,
    this.skipOr,
    this.action,
    this.spaceBtwImg,
    this.hasIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 20),

              /// Top "Skip" and content
              GestureDetector(
                onTap: action,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonMethods.appTexts(
                      context,
                      skipOr ?? "Skip",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Image.asset(image),
              SizedBox(height: spaceBtwImg ?? 20),
              CommonMethods.appTexts(
                context,
                headText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              CommonMethods.appTexts(
                context,
                subText,
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalPages, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: index == currentIndex
                    ? const ActiveScreen()
                    : const InActiveScreen(),
              );
            }),
          ),
          SizedBox(height: 40),
          SmivoxButton(
            text: btnText ?? "Next",
            hasIcon: hasIcon,
            icon: CupertinoIcons.arrow_right,
            onTap: onTap,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

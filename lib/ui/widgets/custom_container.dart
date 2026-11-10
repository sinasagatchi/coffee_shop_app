import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double borderRadius;
  const CustomContainer({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Apptheme.mocha,
            border: Border.all(color: Apptheme.sage),
          ),
        ),
        Container(
          height: height - 5,
          width: width - 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Apptheme.mocha,
          ),
          child: child,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';

class CustomIconButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double borderRadius;
  final void Function()? onTap;
  final String? tooltip;
  const CustomIconButton({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    required this.onTap,
    this.borderRadius = 16,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Apptheme.mocha,
              border: Border.all(
                color: Apptheme.sage,
              ),
            ),
          ),
          Container(
            height: height - 5,
            width: width - 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Apptheme.mocha,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: tooltip == null
                    ? child
                    : Tooltip(message: tooltip!, child: child),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

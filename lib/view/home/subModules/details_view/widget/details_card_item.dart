import 'package:flutter/material.dart';
import 'package:task/utils/extensions/context_ext.dart';

class DetailsCardItem extends StatelessWidget {
  const DetailsCardItem({
    super.key,
    required this.title,
    this.subtitle,
    this.textColor,
    required this.backgroundColor,
    this.height = 170,
  });

  final String title;
  final Widget? subtitle;
  final Color? textColor;
  final Color backgroundColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor ??
                  theme.colorScheme.onSurface.withOpacity(
                    .5,
                  ),
            ),
          ),
          subtitle ?? const SizedBox()
        ],
      ),
    );
  }
}

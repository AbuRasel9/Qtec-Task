import 'package:flutter/material.dart';
import 'package:task/configs/components/custom_country_code_picker.dart';
import 'package:task/utils/extensions/context_ext.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.onSurface.withOpacity(
              .5,
            ),
          ),
        ),
        const Icon(Icons.home, size: 32, color: Colors.green),
        const SizedBox(width: 10),
        Text(
          'Home',
          style: theme.textTheme.headlineLarge,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Good',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        )
      ],
    );
  }
}

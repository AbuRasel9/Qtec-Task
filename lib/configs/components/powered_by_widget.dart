import 'package:flutter/material.dart';
import 'package:task/utils/extensions/context_ext.dart';

class PoweredByWidget extends StatelessWidget {
  const PoweredByWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final theme=context.theme;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Powered by ',
        style: theme.textTheme.bodySmall
            ?.copyWith(color: theme.colorScheme.onSurface.withOpacity(.5)),
        children: <TextSpan>[
          TextSpan(
              text: 'M360 ICT',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.primary)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task/utils/extensions/context_ext.dart';

class HomeCardItem extends StatelessWidget {
  final String title, ppm, percentage, label;
  final VoidCallback onPressed;

  const HomeCardItem({
    super.key,
    required this.title,
    required this.ppm,
    required this.percentage,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title text
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //ppm text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ppm,
                        style: theme.textTheme.displayLarge
                            ?.copyWith(color: theme.colorScheme.primary,fontSize: 40,),
                      ),
                      const SizedBox(width: 8),
                      //
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  percentage,
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text("ppm",
                              style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //person and view details text
            Column(
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3CC381),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  "assets/images/persons.png",
                  height: 40,
                  width: 80,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 4),
                Text(
                  "View Details ▶",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task/configs/routes/routes_name.dart';
import 'package:task/utils/extensions/context_ext.dart';
import 'package:task/view/home/widget/home_card_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top header section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withOpacity(.3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/images/side_background.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerRight,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  //top left section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Good Morning",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(.5),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Ahmed Ariyan",
                          style: theme.textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 20),
                        Text.rich(
                          TextSpan(
                            text: "You are in a ",
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(.4)),
                            children: [
                              TextSpan(
                                  text: "healthy",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.primary)),
                              const TextSpan(text: " environment"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  //top image
                  Image.asset(
                    "assets/images/person.png",
                    height: 80,
                    width: 80,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // My Places Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Places",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(
                      .5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Home Place Card
             HomeCardItem(
              title: "Home",
              ppm: "652",
              percentage: "13%",
              label: "Good", onPressed: () {
                Navigator.pushNamed(context, RoutesName.detailsScreen);
             },
            ),

            // Office Place Card
             HomeCardItem(
              title: "Office",
              ppm: "447",
              percentage: "37%",
              label: "Healthy",
               onPressed: () {
                 Navigator.pushNamed(context, RoutesName.detailsScreen);

               },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3CC381),
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.add),
      ),
    );
  }
}


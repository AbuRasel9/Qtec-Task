import 'package:flutter/material.dart';
import 'package:task/configs/routes/routes_name.dart';
import 'package:task/utils/extensions/context_ext.dart';

import '../../configs/components/powered_by_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void checkAuthentication() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      },
    );
  }

  @override
  void initState() {
    checkAuthentication();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 12.0),
        child: PoweredByWidget(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //splash screen image
          Center(
            child: Image.asset(
              "assets/images/splash_image.png",
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}


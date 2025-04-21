import 'package:flutter/material.dart';

class SignInWithWidget extends StatelessWidget {
  final VoidCallback googleOnPressed,
      facebookOnPressed,
      microsoftOPressed,
      appOnPressed;

  const SignInWithWidget(
      {super.key,
      required this.googleOnPressed,
      required this.facebookOnPressed,
      required this.microsoftOPressed,
      required this.appOnPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: googleOnPressed,
            child: Image.asset(
              "assets/images/google.png",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            )),
        InkWell(
            onTap: facebookOnPressed,
            child: Image.asset(
              "assets/images/facebook.png",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            )),
        InkWell(
            onTap: microsoftOPressed,
            child: Image.asset(
              "assets/images/microsoft.png",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            )),
        InkWell(
          onTap: appOnPressed,
          child: Image.asset(
            "assets/images/apple.png",
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task/configs/components/powered_by_widget.dart';
import 'package:task/utils/extensions/context_ext.dart';

import '../theme/app_color_schemes.dart';

class CustomMobileCountryCode extends StatefulWidget {
  const CustomMobileCountryCode(
      {super.key,
        required this.onChange,
        this.initialSelection,
        this.favoriteCountry, this.isEnable, this.height});

  final Function(CountryCode) onChange;
  final String? initialSelection;
  final List<String>? favoriteCountry;
  final bool? isEnable;
  final double?height;

  @override
  State<CustomMobileCountryCode> createState() => _CustomCountryCodeState();
}

class _CustomCountryCodeState extends State<CustomMobileCountryCode> {

  @override
  Widget build(BuildContext context) {

final theme=context.theme;
    return Container(
    padding:   const EdgeInsets.only(bottom: 1),
      decoration:  BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.7)),
        ),
      ),

      child: CountryCodePicker(
        enabled: widget.isEnable ?? true,
        flagWidth: 16,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        onChanged: widget
            .onChange
        ,
        initialSelection: widget.initialSelection ?? 'BD',
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        favorite: widget.favoriteCountry ?? const ['+880', 'BD'],
      ),
    );
  }
}
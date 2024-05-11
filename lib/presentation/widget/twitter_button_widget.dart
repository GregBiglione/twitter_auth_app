import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../resource/color_manager.dart';
import '../resource/font_manager.dart';
import '../resource/string_manager.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';

class TwitterButtonWidget extends StatelessWidget {
  final Function() onPressed;

  const TwitterButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: ValueManager.infinity,
        height: ValueManager.v50,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              ValueManager.v30,
            ),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: ValueManager.v20,
            ),
            // Logo --------------------------------------------------------------
            FaIcon(
              FontAwesomeIcons.twitter,
              color: ColorManager.white,
              size: ValueManager.v30,
            ),
            // Title -------------------------------------------------------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: ValueManager.v50,
                ),
                child: Text(
                  StringManager.twitterButtonTitle,
                  style: getBoldStyle(
                    fontSize: FontSize.s18,
                    color: ColorManager.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

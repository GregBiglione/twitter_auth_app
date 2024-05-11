import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_app/presentation/resource/color_manager.dart';
import 'package:twitter_auth_app/presentation/resource/font_manager.dart';
import 'package:twitter_auth_app/presentation/resource/string_manager.dart';
import 'package:twitter_auth_app/presentation/resource/style_manager.dart';
import 'package:twitter_auth_app/presentation/resource/value_manager.dart';
import 'package:twitter_auth_app/presentation/widget/padding_widget.dart';
import 'package:twitter_auth_app/presentation/widget/title_widget.dart';

import '../../../../app/constant.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  //----------------------------------------------------------------------------
  // All content
  //----------------------------------------------------------------------------

  Widget _getContentWidget() => PaddingWidget(
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TitleWidget(
          title: StringManager.logInTitle,
        ),
        const SizedBox(
          height: ValueManager.v20,
        ),
        _twitterButtonWidget()
      ],
    ),
  );

  //----------------------------------------------------------------------------
  // Twitter button
  //----------------------------------------------------------------------------

  Widget _twitterButtonWidget() => GestureDetector(
    child: Padding(
      padding: const EdgeInsets.only(
        left: ValueManager.v16,
        right: ValueManager.v16,
      ),
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
      )
    ),
    onTap: () {
      logger.i("Twitter button clicked");
    },
  );
}















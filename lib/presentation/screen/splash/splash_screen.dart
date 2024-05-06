import 'package:flutter/material.dart';
import 'package:twitter_auth_app/presentation/resource/color_manager.dart';
import 'package:twitter_auth_app/presentation/resource/image_manager.dart';
import 'package:twitter_auth_app/presentation/resource/string_manager.dart';
import 'package:twitter_auth_app/presentation/resource/style_manager.dart';
import 'package:twitter_auth_app/presentation/resource/value_manager.dart';

import '../../resource/font_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image -----------------------------------------------------------
            Image.asset(
              ImageManager.twitterLogo,
              fit: BoxFit.cover,
              width: ValueManager.v80,
              height: ValueManager.v80,
            ),
            const SizedBox(
              height: ValueManager.v20,
            ),
            // Title -----------------------------------------------------------
            Text(
              StringManager.appName,
              style: getBoldStyle(
                fontSize: FontSize.s20,
                color: ColorManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

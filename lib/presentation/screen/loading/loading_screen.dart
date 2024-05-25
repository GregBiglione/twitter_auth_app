import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:twitter_auth_app/presentation/resource/color_manager.dart';
import 'package:twitter_auth_app/presentation/resource/value_manager.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: ColorManager.black,
        child: SpinKitFadingCircle(
          color: ColorManager.primary,
          size: ValueManager.v40,
        ),
      ),
    );
  }
}

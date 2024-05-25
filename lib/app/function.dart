import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:twitter_auth_app/presentation/resource/color_manager.dart';

void errorToast(BuildContext context, String message) => toastification.show(
  context: context,
  title: Text(message),
  autoCloseDuration: const Duration(seconds: 2),
  type: ToastificationType.error,
  style: ToastificationStyle.fillColored,
  showProgressBar: false,
  alignment: Alignment.bottomCenter,
  backgroundColor: ColorManager.error,
);
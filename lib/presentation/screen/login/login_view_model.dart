import 'dart:async';

import 'package:flutter/material.dart';
import 'package:twitter_auth_app/app/function.dart';
import 'package:twitter_auth_app/domain/usecase/auth/auth_usecase.dart';

import '../../../domain/utils/state_render.dart';

class LoginViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final StreamController<StateRender> _responseController = StreamController();

  LoginViewModel(this._authUseCase);

  // Getters -------------------------------------------------------------------
  Stream<StateRender> get response => _responseController.stream;
  Timer? timer;

  //----------------------------------------------------------------------------
  // Twitter login
  //----------------------------------------------------------------------------

  void twitterLogin() async {
    _responseController.add(Init());
    // Loading -----------------------------------------------------------------
    _responseController.add(Loading());
    // Login -------------------------------------------------------------------
    removeLoadingScreen(timer, 4, _responseController);
    final data = await _authUseCase.twitterLoginUseCase.launch();
    _responseController.add(data);
  }
}
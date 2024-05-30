import 'package:flutter/material.dart';
import 'package:twitter_auth_app/domain/usecase/auth/auth_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;

  HomeViewModel(this._authUseCase);

  //----------------------------------------------------------------------------
  // Logout
  //----------------------------------------------------------------------------

  void logout() async {
    await _authUseCase.logOutUseCase.launch();
  }
}
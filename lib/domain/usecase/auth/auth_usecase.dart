import 'package:twitter_auth_app/domain/usecase/auth/twitter_login_usecase.dart';
import 'package:twitter_auth_app/domain/usecase/auth/user_session_usecase.dart';

class AuthUseCase {
  final TwitterLoginUseCase twitterLoginUseCase;
  final UserSessionUseCase userSessionUseCase;

  AuthUseCase({required this.twitterLoginUseCase,
    required this.userSessionUseCase});
}
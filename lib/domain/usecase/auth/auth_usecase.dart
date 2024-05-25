import 'package:twitter_auth_app/domain/usecase/auth/twitter_login_usecase.dart';

class AuthUseCase {
  final TwitterLoginUseCase twitterLoginUseCase;

  AuthUseCase({required this.twitterLoginUseCase});
}
import 'package:twitter_auth_app/domain/repository/auth/auth_repository.dart';

class TwitterLoginUseCase {
  final AuthRepository _repository;

  TwitterLoginUseCase(this._repository);

  launch() => _repository.twitterLogin();
}
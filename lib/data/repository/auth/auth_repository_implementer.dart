import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_auth_app/app/secret.dart';
import 'package:twitter_auth_app/domain/repository/auth/auth_repository.dart';
import 'package:twitter_auth_app/domain/utils/state_render.dart';
import 'package:twitter_auth_app/presentation/resource/string_manager.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthRepositoryImplementer extends AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImplementer(this._firebaseAuth);

  @override
  Future<StateRender> twitterLogin() async {
    try {
      final twitterLogin = TwitterLogin(
        apiKey: twitterApiKey,
        apiSecretKey: twitterSecretApiKey,
        redirectURI: redirectURI,
      );
      final result = await twitterLogin.loginV2();

      final credential = TwitterAuthProvider.credential(
        accessToken: result.authToken!,
        secret: result.authTokenSecret!,
      );

      final userCredential = _firebaseAuth.signInWithCredential(credential);

      return Success(credential);
    }
    on FirebaseAuthException catch (e) {
      return Error(e.message ?? StringManager.unknownError);
    }
  }
}
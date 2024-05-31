import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:twitter_auth_app/app/app_preferences.dart';
import 'package:twitter_auth_app/app/secret.dart';
import 'package:twitter_auth_app/domain/repository/auth/auth_repository.dart';
import 'package:twitter_auth_app/domain/utils/state_render.dart';
import 'package:twitter_auth_app/presentation/resource/string_manager.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../../app/constant.dart';
import '../../../app/di/injection.dart';

final AppPreferences _appPreferences = getIt<AppPreferences>();

class AuthRepositoryImplementer extends AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final CollectionReference _usersCollection;

  AuthRepositoryImplementer(this._firebaseAuth,
      @Named(USER) this._usersCollection);

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
      _appPreferences.setUserLogged();

      return Success(credential);
    }
    on FirebaseAuthException catch (e) {
      return Error(e.message ?? StringManager.unknownError);
    }
  }

  @override
  User? get user => _firebaseAuth.currentUser;

  @override
  Future<void> logout() async {
    _appPreferences.logout();
    _firebaseAuth.signOut();
  }
}
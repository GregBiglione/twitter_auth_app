import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:twitter_auth_app/data/repository/auth/auth_repository_implementer.dart';
import 'package:twitter_auth_app/domain/repository/auth/auth_repository.dart';
import 'package:twitter_auth_app/domain/usecase/auth/auth_usecase.dart';
import 'package:twitter_auth_app/domain/usecase/auth/logout_usecase.dart';
import 'package:twitter_auth_app/domain/usecase/auth/twitter_login_usecase.dart';
import 'package:twitter_auth_app/domain/usecase/auth/user_session_usecase.dart';

import '../constant.dart';
import 'firebase_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  // Repository ----------------------------------------------------------------

  AuthRepository get authRepository => AuthRepositoryImplementer(
    firebaseAuth,
    usersCollection,
  );

  // Collection ----------------------------------------------------------------

  @Named(USER)
  @injectable
  CollectionReference get usersCollection => firebaseFirestore.collection(USER);

  // Use case ------------------------------------------------------------------

  AuthUseCase get authUseCase => AuthUseCase(
    twitterLoginUseCase: TwitterLoginUseCase(authRepository), 
    userSessionUseCase: UserSessionUseCase(authRepository), 
    logOutUseCase: LogOutUseCase(authRepository),
  );
}
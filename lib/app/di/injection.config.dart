// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:twitter_auth_app/app/di/app_module.dart' as _i7;
import 'package:twitter_auth_app/app/di/firebase_service.dart' as _i3;
import 'package:twitter_auth_app/domain/repository/auth/auth_repository.dart'
    as _i5;
import 'package:twitter_auth_app/domain/usecase/auth/auth_usecase.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i4.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i5.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i6.AuthUseCase>(() => appModule.authUseCase);
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_auth_app/app/di/injection.dart';
import 'package:twitter_auth_app/domain/usecase/auth/auth_usecase.dart';
import 'package:twitter_auth_app/presentation/resource/route_manager.dart';
import 'package:twitter_auth_app/presentation/resource/theme_manager.dart';
import 'package:twitter_auth_app/presentation/screen/login/login_view_model.dart';

import 'app/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp(getIt<AuthUseCase>()));
}

class MyApp extends StatelessWidget {
  final AuthUseCase _authUseCase;

  const MyApp(this._authUseCase, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final sessionId = _authUseCase.userSessionUseCase.userSession?.uid ?? "Not connected";

    logger.i("Session id: $sessionId");

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(getIt<AuthUseCase>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationTheme(),
      ),
    );
  }
}
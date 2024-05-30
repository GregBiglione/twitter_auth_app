import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_auth_app/app/constant.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // ---------------------------------------------------------------------------
  // Set preferences for user logged
  // ---------------------------------------------------------------------------

  Future<void> setUserLogged() async {
    _sharedPreferences.setBool(IS_USER_LOGGED, true);
  }

  // ---------------------------------------------------------------------------
  // Get preferences for user logged
  // ---------------------------------------------------------------------------

  Future<bool> isUserLogged() async {
    return _sharedPreferences.getBool(IS_USER_LOGGED) ?? false;
  }

  //----------------------------------------------------------------------------
  // Remove preferences for user logged
  //----------------------------------------------------------------------------

  Future<void> logout() async {
    _sharedPreferences.remove(IS_USER_LOGGED);
  }
}
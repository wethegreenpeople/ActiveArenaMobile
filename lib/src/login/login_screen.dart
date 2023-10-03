import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:game_template/src/api_utils/fighter_api.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatelessWidget {
  static final _log = Logger('LoginScreen');
  final SupabaseClient _supabase;
  final FighterApi _fighterApi = FighterApi();

  LoginScreen(SupabaseClient superbaseClient, {Key? key})
      : _supabase = superbaseClient,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Active Arena',
      logo: AssetImage('assets/images/sprites/player.png'),
      onLogin: authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        GoRouter.of(context).go('/play');
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  Future<String?> authUser(LoginData data) async {
    _log.info("Logging in user ${data.name}");
    try {
      await _supabase.auth.signInWithPassword(
        email: data.name,
        password: data.password,
      );

      return null;
    } on AuthException catch (_, ex) {
      _log.info("Unable to login user ${data.name}");
      _log.info(_.toString());
      return "Unable to login";
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    _log.info("Creating user ${data.name}");

    if (data.name!.isEmpty || data.password!.isEmpty) {
      _log.info("Invalid username or password");
      return "Invalid username or password";
    }
    try {
      await _supabase.auth.signUp(
        email: data.name,
        password: data.password!,
      );
    } on AuthException catch (_, ex) {
      _log.info("Unable to create user ${data.name}");
      _log.info(_.toString());
      return "Unable to create user";
    }

    _fighterApi.createFighter();

    return null;
  }

  Future<String> _recoverPassword(String name) async {
    return "";
  }
}

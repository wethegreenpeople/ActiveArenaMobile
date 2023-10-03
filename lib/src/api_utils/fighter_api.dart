import 'package:game_template/constants.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class FighterApi {
  final supabaseClient = Supabase.instance.client;

  Future createFighter() async {
    var fighter = await http.post(Uri.parse(Constants.apiUrl + '/fighter'),
        headers: Map.of({
          "Authorization": supabaseClient.auth.currentSession!.accessToken
        }));

    return null;
  }
}

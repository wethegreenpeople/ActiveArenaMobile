import 'dart:convert';

import 'package:game_template/constants.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

import 'fighter_model.dart';

class FighterApi {
  final supabaseClient = Supabase.instance.client;

  Future createFighter() async {
    var fighter = await http.post(Uri.parse('${Constants.apiUrl}/fighter'),
        headers: Map.of({
          "Authorization": supabaseClient.auth.currentSession!.accessToken
        }));

    return null;
  }

  Future<List<Fighter>> getFighters() async {
    try {
      var response = await http.get(Uri.parse('${Constants.apiUrl}/fighter'),
          headers: Map.of({
            "Authorization": supabaseClient.auth.currentSession!.accessToken,
          }));

      if (response.statusCode != 200) {
        return [];
      }

      return List<Fighter>.from(
          json.decode(response.body).map((x) => Fighter.fromJson(x)));
    } on Exception catch (e) {
      var doot = "";
    }

    return [];
  }
}

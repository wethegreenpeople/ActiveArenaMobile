import 'dart:convert';

import 'package:game_template/constants.dart';
import 'package:game_template/src/play_session/models/arena.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class ArenaApi {
  final supabaseClient = Supabase.instance.client;

  Future<Arena?> joinArena(String fighterId) async {
    var result = await http.put(Uri.parse('${Constants.apiUrl}/Arena'),
        headers: Map.of({
          "Authorization": supabaseClient.auth.currentSession!.accessToken,
          "Content-Type": "application/json"
        }),
        body: json.encode(fighterId));

    if (result.statusCode != 200) {
      return null;
    }

    return Arena.fromJson(json.decode(result.body));
  }
}

import 'dart:convert';

import 'package:votosflutter/models/votos.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = "http://192.168.1.47:3000/votos";

  Future<List<Votos>> getVotos() async {
    Response res = await get(apiUrl);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Votos> votos =
          body.map((dynamic item) => Votos.fromJson(item)).toList();
      return votos;
    } else {
      throw "Falló la llamada a la lista";
    }
  }
}

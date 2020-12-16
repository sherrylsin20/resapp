import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resapp/models/recipes.dart';

class APIService {
  Future<List<Recipes>> getRecipes() async {
    List<Recipes> list;
    final String url = 'https://masak-apa.tomorisakura.vercel.app/api/recipes';

    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["results"] as List;
      print(rest);
      list = rest.map<Recipes>((json) => Recipes.fromJson(json)).toList();
    }
    print("List Size: ${list.length}");
    return list;
  }
}

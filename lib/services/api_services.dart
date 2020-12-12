import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:resapp/models/recipes.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'https://masak-apa.tomorisakura.vercel.app/api/';

  //Generate latest recipes
  Future<Recipes> generateRecipes(category, recipes) async {
    if (category == null) category = '';
    recipes = 'recipes';
    Uri uri = Uri.https(_baseUrl, category, recipes);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Recipes recipe = Recipes.fromMap(data);
      return recipe;
    } catch (err) {
      throw err.toString();
    }
  }
}

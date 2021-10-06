import 'package:http/http.dart';

const String apiKey = '762f17504cc54520eccdde7de8da1695';
const String apiId = '566fcaaf';
const String apiUrl = 'https://api.edamam.com/search';

Future getData(String url) async {
  print('Calling url: ${Uri.parse(url)}');
  final response = await get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print(response.statusCode);
  }
}

class RecipeService {
  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    print('----');
    print(recipeData);
    return recipeData;
  }
}

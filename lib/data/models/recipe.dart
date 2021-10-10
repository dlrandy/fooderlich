import 'package:equatable/equatable.dart';
import 'ingredient.dart';

class Recipe extends Equatable {
  int? id;
  final String label;
  final String image;
  final String url;
  List<Ingredient> ingredients = [];
  final double calories;
  final double totalWeight;
  final double totalTime;
  Recipe(
      {this.id,
      required this.label,
      required this.image,
      required this.url,
      required this.calories,
      required this.totalWeight,
      required this.totalTime});
  @override
  List<Object> get props =>
      [label, image, url, calories, totalWeight, totalTime];
}

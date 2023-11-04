import 'foods.dart';

class FoodsResponse {

  List<Foods> foodsList;
  int success;

  FoodsResponse({required this.foodsList, required this.success});

  factory FoodsResponse.fromJson(Map<String, dynamic> json) {

    var jsonArray = json["yemekler"] as List;
    int success = json["success"] as int;

    var foodsList = jsonArray.map((object) => Foods.fromJson(object)).toList();

    return FoodsResponse(foodsList: foodsList, success: success);
  }
}
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:food_app/data/entity/foods.dart';
import 'package:food_app/data/entity/foods_response.dart';

class FoodsDaoRepository {

  List<Foods> parseFoods(String response) {

    return FoodsResponse.fromJson(jsonDecode(response)).foodsList;
  }

  Future<List<Foods>> listFoods() async {

    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var response = await Dio().get(url);
    
    return parseFoods(response.data.toString());
  }
}
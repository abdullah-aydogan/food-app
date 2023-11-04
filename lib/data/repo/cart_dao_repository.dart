import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:food_app/data/entity/cart.dart';
import 'package:food_app/data/entity/cart_response.dart';

class CartDaoRepository {

  List<Cart> parseCart(String response) {

    return CartResponse.fromJson(jsonDecode(response)).cartItems;
  }

  Future<List<Cart>> listCartItems(String username) async {

    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var data = {"kullanici_adi":username};
    var response = await Dio().post(url, data: FormData.fromMap(data));

    return parseCart(response.data.toString());
  }

  Future<void> addToCart(String name, String img_name, String price, String piece, String username) async {

    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";

    var data = {"yemek_adi":name, "yemek_resim_adi":img_name, "yemek_fiyat":price,
      "yemek_siparis_adet":piece, "kullanici_adi":username};

    var response = await Dio().post(url, data: FormData.fromMap(data));

    print("Sepete Ekle: ${response.data.toString()}");
  }
}
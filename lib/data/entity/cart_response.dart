import 'package:food_app/data/entity/cart.dart';

class CartResponse {

  List<Cart> cartItems;
  int success;

  CartResponse({required this.cartItems, required this.success});

  factory CartResponse.fromJson(Map<String, dynamic> json) {

    var jsonArray = json["sepet_yemekler"] as List;
    int success = json["success"] as int;

    var cartItems = jsonArray.map((object) => Cart.fromJson(object)).toList();

    return CartResponse(cartItems: cartItems, success: success);
  }
}
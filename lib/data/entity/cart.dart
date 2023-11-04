class Cart {

  String id;
  String name;
  String img_name;
  String price;
  String piece;
  String username;

  Cart({
    required this.id,
    required this.name,
    required this.img_name,
    required this.price,
    required this.piece,
    required this.username
  });

  factory Cart.fromJson(Map<String, dynamic> json) {

    return Cart(
      id: json["sepet_yemek_id"] as String,
      name: json["yemek_adi"] as String,
      img_name: json["yemek_resim_adi"] as String,
      price: json["yemek_fiyat"] as String,
      piece: json["yemek_siparis_adet"] as String,
      username: json["kullanici_adi"] as String,
    );
  }
}
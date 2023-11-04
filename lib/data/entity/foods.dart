class Foods {

  String id;
  String name;
  String img_name;
  String price;

  Foods({required this.id, required this.name, required this.img_name, required this.price});

  factory Foods.fromJson(Map<String, dynamic> json) {

    return Foods(
        id: json["yemek_id"] as String,
        name: json["yemek_adi"] as String,
        img_name: json["yemek_resim_adi"] as String,
        price: json["yemek_fiyat"] as String
    );
  }
}
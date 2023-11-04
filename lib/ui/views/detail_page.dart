import 'package:flutter/material.dart';
import 'package:food_app/data/entity/foods.dart';

class DetailPage extends StatefulWidget {

  Foods food;

  DetailPage({required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  String baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemek Detayı", style: TextStyle(fontFamily: "Agbalumo")),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: 180,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network("$baseUrl/${widget.food.img_name}"),
                  )
                )
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.food.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("${widget.food.price}.00 ₺", style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
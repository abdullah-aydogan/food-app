import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/entity/foods.dart';
import 'package:food_app/ui/cubit/detail_page_cubit.dart';
import 'package:food_app/ui/views/cart_page.dart';

class DetailPage extends StatefulWidget {

  Foods food;

  DetailPage({required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  String baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler";
  int counter = 1;
  int totalPrice = 0;
  String username = "abdullah_aydogan";

  @override
  void initState() {

    super.initState();
    totalPrice = int.parse(widget.food.price);
  }

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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
            Text(widget.food.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("${widget.food.price}.00 ₺", style: const TextStyle(fontSize: 22)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    side: const BorderSide(
                      width: 1.0,
                    )
                  ),
                  onPressed: () {
                    setState(() {
                      if(counter == 1) {
                        return;
                      }

                      else {
                        counter--;
                        totalPrice -= int.parse(widget.food.price);
                      }
                    });
                  },
                  child: const Text("-", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text("${counter.toString()} Adet", style: const TextStyle(fontSize: 20)),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      side: const BorderSide(
                        width: 1.0,
                      )
                  ),
                  onPressed: () {
                    setState(() {
                      counter++;
                      totalPrice += int.parse(widget.food.price);
                    });
                  },
                  child: const Text("+", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Spacer(),
            TextButton.icon(
              style: TextButton.styleFrom(
                  side: const BorderSide(
                    width: 1.0,
                  )
              ),
              onPressed: () {
                context.read<DetailPageCubit>().addToCart(widget.food.name, widget.food.img_name,
                    totalPrice.toString(), counter.toString(), username);

                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
              },
              label: const Text("Sepete Ekle", style: TextStyle(fontSize: 18)),
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
              child: Text("Toplam : $totalPrice.00 ₺", style: const TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
    );
  }
}
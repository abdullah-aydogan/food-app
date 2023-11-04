import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/entity/cart.dart';
import 'package:food_app/ui/cubit/cart_page_cubit.dart';

class CartPage extends StatefulWidget {

  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  String baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler";
  String username = "abdullah_aydogan";

  @override
  void initState() {

    super.initState();
    context.read<CartPageCubit>().listCardItems(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetteki Yemekler", style: TextStyle(fontFamily: "Agbalumo")),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Ödeme ekranına geçiş yapılıyor...")),
              );
            },
            icon: const Icon(Icons.shopping_cart_checkout_outlined),
          ),
        ],
      ),
      body: BlocBuilder<CartPageCubit, List<Cart>>(
        builder: (context, cartItems) {
          if(cartItems.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var cartItem = cartItems[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: Image.network("$baseUrl/${cartItem.img_name}")
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cartItem.name,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                                ),
                                Text("${cartItem.price}.00 ₺", style: const TextStyle(fontSize: 18)),
                                Text("${cartItem.piece} Adet", style: const TextStyle(fontSize: 18)),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                context.read<CartPageCubit>().deleteCartItem(cartItem.id, username);

                                if(cartItems.length == 1) {
                                  context.read<CartPageCubit>().deleteCartItem(cartItem.id, username);
                                  cartItems.clear();
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                }
                              },
                              icon: const Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          else {
            return const Center(
              child: Text("Sepetiniz boş, sepetinize yemek ekleyin.",
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
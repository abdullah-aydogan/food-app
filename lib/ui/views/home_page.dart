import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/entity/foods.dart';
import 'package:food_app/ui/colors.dart';
import 'package:food_app/ui/cubit/home_page_cubit.dart';
import 'package:food_app/ui/views/cart_page.dart';
import 'package:food_app/ui/views/detail_page.dart';
import 'package:food_app/ui/views/favorites_page.dart';
import 'package:food_app/ui/views/profile_page.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  var pages = [const CartPage()];

  @override
  void initState() {

    super.initState();
    context.read<HomePageCubit>().listFoods();
  }

  @override
  Widget build(BuildContext context) {

    String baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text("Aydoğan Yemek", style: TextStyle(fontFamily: "Agbalumo")),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Foods>>(
        builder: (context, foodsList) {
          if(foodsList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: foodsList.length,
                itemBuilder: (context, index) {
                  var food = foodsList[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DetailPage(food: food)
                          )
                        );
                      },
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
                                child: Image.network("$baseUrl/${food.img_name}")
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(food.name,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                                  ),
                                  const SizedBox(height: 10),
                                  Text("${food.price}.00 ₺", style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => DetailPage(food: food)
                                    )
                                  );
                                },
                                icon: const Icon(Icons.navigate_next_outlined),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          else {
            return const Center();
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Aydoğan Yemek", style: TextStyle(fontFamily: "Agbalumo", fontSize: 26, color: Colors.white),
                    textAlign: TextAlign.center
                  ),
                  Icon(Icons.fastfood_outlined, color: Colors.white),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite_outline, color: secondaryColor),
              title: const Text("Favoriler"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritesPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_outline, color: primaryColor),
              title: const Text("Profil Sayfası"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
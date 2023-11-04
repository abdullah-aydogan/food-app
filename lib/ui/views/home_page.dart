import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/entity/foods.dart';
import 'package:food_app/ui/cubit/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
        title: const Text("Aydoğan Yemek", style: TextStyle(fontFamily: "Agbalumo")),
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
                    child: Card(
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
                                Text(food.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Text("${food.price}.00 ₺", style: const TextStyle(fontSize: 18)),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {

                              },
                              icon: const Icon(Icons.navigate_next_outlined),
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
            return const Center();
          }
        },
      ),
    );
  }
}
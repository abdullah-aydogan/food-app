import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/entity/favorites.dart';
import 'package:food_app/ui/colors.dart';
import 'package:food_app/ui/cubit/favorites_page_cubit.dart';

class FavoritesPage extends StatefulWidget {

  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  String baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler";

  @override
  void initState() {

    super.initState();
    context.read<FavoritesPageCubit>().listToFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text("Favoriler", style: TextStyle(fontFamily: "Agbalumo")),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoritesPageCubit, List<Favorites>>(
        builder: (context, favoritesList) {
          if(favoritesList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: favoritesList.length,
                itemBuilder: (context, index) {
                  var item = favoritesList[index];

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
                                child: Image.network("$baseUrl/${item.img_name}")
                            ),
                            const SizedBox(width: 20),
                            Text(item.name,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                context.read<FavoritesPageCubit>().removeToFavorites(item.id);
                              },
                              icon: Icon(Icons.cancel_outlined, color: secondaryColor),
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
              child: Text("Favori listeniz boş.",
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
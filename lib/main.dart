import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/ui/cubit/cart_page_cubit.dart';
import 'package:food_app/ui/cubit/detail_page_cubit.dart';
import 'package:food_app/ui/cubit/favorites_page_cubit.dart';
import 'package:food_app/ui/cubit/home_page_cubit.dart';
import 'package:food_app/ui/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(create: (context) => CartPageCubit()),
        BlocProvider(create: (context) => DetailPageCubit()),
        BlocProvider(create: (context) => FavoritesPageCubit()),
      ],
      child: MaterialApp(
        title: 'Aydoğan Yemek',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
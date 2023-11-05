import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/repo/cart_dao_repository.dart';
import 'package:food_app/data/repo/favorites_dao_repository.dart';

class DetailPageCubit extends Cubit<void> {

  DetailPageCubit() : super(0);

  var repo = CartDaoRepository();
  var favoritesRepo = FavoritesDaoRepository();

  Future<void> addToCart(String name, String img_name, String price, String piece, String username) async {

    await repo.addToCart(name, img_name, price, piece, username);
  }

  Future<void> addToFavorites(String name, String img_name, int status) async {

    await favoritesRepo.addToFavorites(name, img_name, status);
  }
}
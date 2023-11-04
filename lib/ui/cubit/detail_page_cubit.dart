import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/repo/cart_dao_repository.dart';

class DetailPageCubit extends Cubit<void> {

  DetailPageCubit() : super(0);

  var repo = CartDaoRepository();

  Future<void> addToCart(String name, String img_name, String price, String piece, String username) async {

    await repo.addToCart(name, img_name, price, piece, username);
  }
}
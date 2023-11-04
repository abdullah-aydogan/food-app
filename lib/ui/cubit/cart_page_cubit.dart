import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/entity/cart.dart';
import 'package:food_app/data/repo/cart_dao_repository.dart';

class CartPageCubit extends Cubit<List<Cart>> {

  CartPageCubit() : super(<Cart>[]);

  var repo = CartDaoRepository();

  Future<void> listCardItems(String username) async {

    var cartItems = await repo.listCartItems(username);
    emit(cartItems);
  }

  Future<void> deleteCartItem(String id, String username) async {

    await repo.deleteCartItem(id, username);
    await listCardItems(username);
  }
}
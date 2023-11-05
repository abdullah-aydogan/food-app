import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/entity/favorites.dart';
import 'package:food_app/data/repo/favorites_dao_repository.dart';

class FavoritesPageCubit extends Cubit<List<Favorites>> {

  FavoritesPageCubit() : super(<Favorites>[]);

  var repo = FavoritesDaoRepository();

  Future<void> listToFavorites() async {

    var favoriteItems = await repo.listToFavorites();
    emit(favoriteItems);
  }

  Future<void> removeToFavorites(int id) async {

    await repo.removeToFavorites(id);
    await listToFavorites();
  }

  Future<void> saveFavoriteStatus(int id, int status) async {

    await repo.saveFavoriteStatus(id, status);
  }
}
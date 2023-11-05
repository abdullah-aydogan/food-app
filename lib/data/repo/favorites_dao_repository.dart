import 'package:food_app/data/entity/favorites.dart';
import 'package:food_app/sqlite/database_helper.dart';

class FavoritesDaoRepository {

  Future<void> addToFavorites(String name, String img_name, int status) async {

    var db = await DatabaseHelper.databaseAccess();
    var item = Map<String, dynamic>();

    item["name"] = name;
    item["img_name"] = img_name;
    item["status"] = status;

    await db.insert("favorites", item);
  }

  Future<void> removeToFavorites(int id) async {

    var db = await DatabaseHelper.databaseAccess();

    await db.delete("favorites", where: "id = ?", whereArgs: [id]);
  }

  Future<List<Favorites>> listToFavorites() async {

    var db = await DatabaseHelper.databaseAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM favorites ORDER BY id DESC");

    return List.generate(maps.length, (index) {

      var row = maps[index];

      return Favorites(id: row["id"], name: row["name"], img_name: row["img_name"], status: row["status"]);
    });
  }

  Future<void> saveFavoriteStatus(int id, int status) async {

    var db = await DatabaseHelper.databaseAccess();
    var updatedFavorite = Map<String, dynamic>();

    updatedFavorite["status"] = status;

    await db.update("favorites", updatedFavorite, where: "id = ?", whereArgs: [id]);
  }
}
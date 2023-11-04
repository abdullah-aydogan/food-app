import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/entity/foods.dart';
import 'package:food_app/data/repo/foods_dao_repository.dart';

class HomePageCubit extends Cubit<List<Foods>> {

  HomePageCubit() : super(<Foods>[]);

  var repo = FoodsDaoRepository();

  Future<void> listFoods() async {

    var foodList = await repo.listFoods();
    emit(foodList);
  }
}
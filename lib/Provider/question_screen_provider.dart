import 'package:flutter/foundation.dart';
import 'package:lesson_delivery_app_ui/model/courseModule.dart';
import 'package:lesson_delivery_app_ui/model/moduleQuestion.dart';
import 'package:lesson_delivery_app_ui/model/tutor.dart';
import 'package:intl/intl.dart';

import '../database/db_helper.dart';
import '../database/db_model.dart';
import '../model/food.dart';

class ChoiceProvider extends ChangeNotifier {
  DatabaseHelper? databaseHelper;

  late Future<List<Carts>> cartsList;
  bool isFav = false;

  ChoiceProvider() {
    databaseHelper = DatabaseHelper();
  }
  loadData() async {
    cartsList = databaseHelper!.getCarts();
  }

  void toggleFavorite() {
    isFav = !isFav;
    notifyListeners();
  }

  void addToCart(CourseModule menuItem, Tutor tutor) {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    databaseHelper!
        .insert(Carts(
            date: formattedDate,
            price: menuItem.price!.toDouble(),
            food: menuItem.name.toString(),
            tutor: tutor!.name.toString(),
            quantity: 1,
            imageURL: menuItem.imageUrl.toString()))
        .then((value) {
      if (kDebugMode) {
        print('cart inserted. $value');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: ' + error.toString());
      }
    });
    notifyListeners();
  }
}

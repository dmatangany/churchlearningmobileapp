import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../database/db_helper.dart';
import '../database/db_model.dart';
import '../model/order.dart';

class PopularItemsProvider extends ChangeNotifier {
  DatabaseHelper? databaseHelper;
  Future<List<Carts>>? cartsList;
  int len = 0;
  double totalPrice = 0;

  PopularItemsProvider() {
    databaseHelper = DatabaseHelper();
    loadHomePage();
  }

  loadHomePage() async{
    cartsList = databaseHelper!.getCarts();
    List<Carts> carts = await cartsList!;
    len = carts.length;
    notifyListeners();

  }
  void addToCart(Order order) {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);

    databaseHelper!
        .insert(Carts(
        date: formattedDate,
        price: order.courseModule!.price!.toDouble(),
        food: order.courseModule!.name.toString(),
        tutor: order.tutor.toString(),
        quantity: 1,
        imageURL: order.courseModule!.imageUrl.toString()))
        .then((value) {
      if (kDebugMode) {
        print('cart inserted. $value');
      }
    }).onError((error, stackTrace) {
      print('error: ' + error.toString());
    });
    
    notifyListeners();
  }
}

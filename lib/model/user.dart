import '/model/order.dart';

class User {
   String? name;
   List<Order>? orders;
   List<Order>? cart;

  User({
    this.name,
    this.orders,
    this.cart,
  });
}

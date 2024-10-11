class Carts {
  int? id;
  double price;
  String food;
  String date;
  String imageURL;
  String tutor;
  int quantity;

  Carts(
      {this.id,
      required this.date,
      required this.price,
      required this.food,
      required this.tutor,
      required this.quantity,
      required this.imageURL});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'food': food,
      'quantity': quantity,
      'tutor': tutor,
      'date': date,
      'imageURL': imageURL
    };
  }
}

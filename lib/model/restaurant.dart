import '/model/courseModule.dart';

class Restaurant {
   String? imageUrl;
   String? name;
   String? address;
   int? rating;
   List<CourseModule>? menu;

  Restaurant({
    this.imageUrl,
    this.name,
    this.address,
    this.rating,
    this.menu,
  });
}

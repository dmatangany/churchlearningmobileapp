import '/model/courseModule.dart';

class Tutor {
   String? imageUrl;
   String? name;
   String? role;
   int? rating;
   List<CourseModule>? courseModules;

  Tutor({
    this.imageUrl,
    this.name,
    this.role,
    this.rating,
    this.courseModules,
  });
}

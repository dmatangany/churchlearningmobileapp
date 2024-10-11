import '/model/tutor.dart';
import '/model/examSetup.dart';
import '/model/courseMedia.dart';

class CourseModule {
   String? imageUrl;
   String? name;
   double? price;
   int? rating;
   Tutor? tutor;
   List<ExamSetup>? examSetups;
   List<CourseMedia>? mediaList;

  CourseModule({
    this.imageUrl,
    this.name,
    this.price,
    this.rating,
    this.tutor,
    this.examSetups,
    this.mediaList
  });
}

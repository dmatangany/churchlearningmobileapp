import '/model/courseModule.dart';
import '/model/moduleQuestion.dart';

class ExamSetup {
   String? imageUrl;
   String? title;
   int? rating;
   List<ModuleQuestion>? questions;

  ExamSetup({
    this.imageUrl,
    this.title,
    this.rating,
    this.questions,
  });
}

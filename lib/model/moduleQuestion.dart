import '/model/courseModule.dart';
import '/model/questionChoice.dart';

class ModuleQuestion {
   String? imageUrl;
   String? questiontext;
   String? questiontype;
   int? rating;
   String? finalExamStatus;
   List<QuestionChoice>? choices;
   List<int>? correct;

  ModuleQuestion({
    this.imageUrl,
    this.questiontext,
    this.questiontype,
    this.rating,
    this.finalExamStatus,
    this.choices,
	this.correct,
  });
}

import '/model/courseModule.dart';
import '/model/questionChoice.dart';

class ModuleQuestion {
   String? imageUrl;
   String? questiontext;
   String? questiontype;
   int? rating;
   List<QuestionChoice>? choices;
   List<int>? correct;

  ModuleQuestion({
    this.imageUrl,
    this.questiontext,
    this.questiontype,
    this.rating,
    this.choices,
	this.correct,
  });
}

import '/model/moduleQuestion.dart';

class QuestionChoice {
  String? choice;
  bool? isChecked;
  bool? isCorrect;
  int? selected;
  int? choiceIndex;
  ModuleQuestion? moduleQuestion;

  QuestionChoice({
    this.choice,
    this.isChecked,
    this.isCorrect,
    this.selected,
    this.choiceIndex,
    this.moduleQuestion,
  });
}

import '/model/moduleQuestion.dart';

class QuestionChoice {
  String? choice;
  bool? isChecked;
  int? selected;
  int? choiceIndex;
  ModuleQuestion? moduleQuestion;

  QuestionChoice({
    this.choice,
    this.selected,
    this.choiceIndex,
    this.isChecked,
    this.moduleQuestion,
  });
}

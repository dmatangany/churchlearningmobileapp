import 'package:lesson_delivery_app_ui/model/courseMedia.dart';
import 'package:lesson_delivery_app_ui/model/moduleQuestion.dart';
import '/model/moduleQuestion.dart';
import '/model/questionChoice.dart';
import '/model/courseModule.dart';
import '/model/courseMedia.dart';
import '/model/order.dart';
import '/model/examSetup.dart';
import '/model/user.dart';
import '/model/tutor.dart';

final _media_1 = CourseMedia(imageUrl: 'assets/images/mediapdf.jpg', fileUrl: "https://psconnectpt.alwaysdata.net/sdp/uploads/346662_LEARNING_CORPUS_00323.pdf", contentType: "PDF", name: "LEARNING CORPUS", filename: "346662_LEARNING_CORPUS_00323.pdf");

final _media_2 = CourseMedia(imageUrl: 'assets/images/mediapdf.jpg', fileUrl: "https://psconnectpt.alwaysdata.net/sdp/uploads/344971_LEARNING_CORPUS_00323.pdf", contentType: "PDF", name: "LEARNING CORPUS V2", filename: "344971_LEARNING_CORPUS_00323.pdf");

final _media_3 = CourseMedia(imageUrl: 'assets/images/mediayoutube.jpg', fileUrl: "7dugfwJthBY", contentType: "YOUTUBE", name: "Business is about purpose", filename: "Business Is About Purpose");

final _media_4 = CourseMedia(imageUrl: 'assets/images/mediamp4.jpg', fileUrl: "https://psconnectpt.alwaysdata.net/sdp/uploads/seaside.mp4",contentType: "MP4",  name: "Seance Session", filename: "seaside.mp4");

final _question_0 = ModuleQuestion(imageUrl: 'assets/images/question.jpg', questiontext: 'Who is Jesus?', questiontype: "single-answer", rating: 4, choices: [], correct: [], finalExamStatus: "not-taken");

final _question_1_choice_1 = QuestionChoice(choice: 'A spirit being', isChecked: false, isCorrect: false, selected: 0, choiceIndex: 0, moduleQuestion: _question_0);

final _question_1_choice_2 = QuestionChoice(choice: 'A woman',  isChecked: false, isCorrect: false, selected: 0, choiceIndex: 1, moduleQuestion: _question_0);

final _question_1_choice_3 = QuestionChoice(choice: 'The promised  messiah',  isChecked: false, isCorrect: false, selected: 0, choiceIndex: 2, moduleQuestion: _question_0);

final _question_1_choice_4 = QuestionChoice(choice: 'An angel from heaven',  isChecked: false, isCorrect: false, selected: 0, choiceIndex: 3, moduleQuestion: _question_0);

final _question_1 = ModuleQuestion(imageUrl: 'assets/images/question.jpg', questiontext: 'Who is Jesus?', questiontype: "single-answer", rating: 4, choices: [_question_1_choice_1, _question_1_choice_2, _question_1_choice_3, _question_1_choice_4], correct: [2], finalExamStatus: "not-taken");

final _question_2 = ModuleQuestion(imageUrl: 'assets/images/question.jpg', questiontext: 'Who is Gabriel?', questiontype: "single-answer", rating: 4,  choices: [_question_1_choice_1, _question_1_choice_2, _question_1_choice_3, _question_1_choice_4], correct: [3], finalExamStatus: "not-taken");

final _question_3 = ModuleQuestion(imageUrl: 'assets/images/question.jpg', questiontext: 'Who is Mary Magdalene?', questiontype: "multiple-answer", rating: 4,  choices: [_question_1_choice_1, _question_1_choice_2, _question_1_choice_3, _question_1_choice_4], correct: [0, 1], finalExamStatus: "not-taken");

// ExamSetup
final _examsetup0 = ExamSetup(
  imageUrl: 'assets/images/exampractice.jpg',
  title: 'Practice Exam 1',
  rating: 5,
  questions: [_question_1],
);
final _examsetup1 = ExamSetup(
  imageUrl: 'assets/images/examreal.jpg',
  title: 'Final Module Exam ',
  rating: 5,
  questions: [_question_0, _question_1, _question_2, _question_3],
);
final _examsetup2 = ExamSetup(
  imageUrl: 'assets/images/exampractice.jpg',
  title: 'Practice Exam 3',
  rating: 5,
  questions: [_question_1, _question_2, _question_3],
);
final _examsetup3 = ExamSetup(
  imageUrl: 'assets/images/exampractice.jpg',
  title: 'Practice Exam 3A',
  rating: 5,
  questions: [_question_0],
);
final _examsetup4 = ExamSetup(
  imageUrl: 'assets/images/exampractice.jpg',
  title: 'Practice Exam 3B',
  rating: 5,
  questions: [_question_0],
);
final _examsetup5 = ExamSetup(
  imageUrl: 'assets/images/exampractice.jpg',
  title: 'Practice Exam 3C',
  rating: 5,
  questions: [_question_0],
);
final _examsetup6 = ExamSetup(
  imageUrl: 'assets/images/exampractice.jpg',
  title: 'Moses Practice Exam 3D',
  rating: 5,
  questions: [_question_0],
);

// CourseModule
CourseModule _mosesTutorial = CourseModule(imageUrl: 'assets/images/moses.jpg', name: 'Moses', price: 68.99,rating: 7, examSetups: [  _examsetup0,_examsetup1,_examsetup2,_examsetup3], mediaList: [_media_1, _media_2, _media_3, _media_4]);
final _joshuaTutorial = CourseModule(imageUrl: 'assets/images/joshua.jpg', name: 'Joshua', price: 87.99,rating: 7, examSetups: [_examsetup4], mediaList: [_media_3, _media_4]);
final _kingsTutorial = CourseModule(imageUrl: 'assets/images/kings.jpg', name: 'Age Of Kings', price: 94.99,rating: 7, examSetups: [_examsetup4,_examsetup5], mediaList: []);
final _abrahamTutorial = CourseModule(imageUrl: 'assets/images/abraham.jpg', name: 'Abraham', price: 113.99,rating: 7, examSetups: [_examsetup6], mediaList: []);
final _pancakes = CourseModule(imageUrl: 'assets/images/bible.png', name: 'Joseph In Egypt', price: 79.99,rating: 7, examSetups: [_examsetup5], mediaList: []);
final _burger = CourseModule(imageUrl: 'assets/images/bible.png', name: 'Jesus: Early Life', price: 50.10,rating: 7, examSetups: [_examsetup5], mediaList: []);
final _pizza = CourseModule(imageUrl: 'assets/images/bible.png', name: 'Jesus The Messiah', price: 121.99,rating: 7, examSetups: [_examsetup6], mediaList: []);
final _salmon = CourseModule(imageUrl: 'assets/images/bible.png', name: 'The Arisen Jesus', price: 102.99,rating: 7, examSetups: [_examsetup6], mediaList: []);

final _davison = Tutor(imageUrl: 'assets/images/davison.jpg', name: 'Davison', rating: 7, role: "Tutor", courseModules: [_mosesTutorial, _abrahamTutorial]);

final _james = Tutor(imageUrl: 'assets/images/james.jpg', name: 'James', rating: 7, role: "Pastor",  courseModules: [_joshuaTutorial, _kingsTutorial]);

final List<Tutor> tutors = [
  _davison,
  _james
];

// Popular Items
final currentUser = User(
  name: 'Basit',
  orders: [
    Order(
      date: 'Jun 2, 2023',
      courseModule: _mosesTutorial,
      tutor: _davison,
      quantity: 1,
    ),
    Order(
      date: 'Jun 2 , 2023',
      courseModule: _pizza,
      tutor: _davison,
      quantity: 1,
    ),
    Order(
      date: 'Jun 3, 2023',
      courseModule: _kingsTutorial,
      tutor: _davison,
      quantity: 1,
    ),
    Order(
      date: 'Jun 3, 2023',
      courseModule: _joshuaTutorial,
      tutor: _davison,
      quantity: 1,
    ),
    Order(
      date: 'Jun 3, 2023',
      courseModule: _abrahamTutorial,
      tutor: _james,
      quantity: 3,
    ),
    Order(
      date: 'Nov 5, 2019',
      courseModule: _mosesTutorial,
      tutor: _james,
      quantity: 2,
    ),
  ],
);

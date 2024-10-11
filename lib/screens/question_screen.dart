import 'package:flutter/material.dart';
import 'package:lesson_delivery_app_ui/database/db_helper.dart';
import 'package:lesson_delivery_app_ui/model/courseModule.dart';
import 'package:lesson_delivery_app_ui/model/examSetup.dart';
import 'package:lesson_delivery_app_ui/model/moduleQuestion.dart';
import 'package:lesson_delivery_app_ui/model/questionChoice.dart';
import 'package:lesson_delivery_app_ui/model/order.dart';
import 'package:lesson_delivery_app_ui/model/tutor.dart';
import 'package:lesson_delivery_app_ui/widgets/rating_stars.dart';
import 'package:provider/provider.dart';
import '../Provider/exam_screen_provider.dart';
import '../Provider/question_screen_provider.dart';
import 'package:collection/collection.dart';

class ChoiceScreen extends StatefulWidget {
  final ModuleQuestion? moduleQuestion;

  const ChoiceScreen({this.moduleQuestion, Key? key}) : super(key: key);

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  DatabaseHelper? databaseHelper;
  int? selectedRadio = 0;
  Function eq = const ListEquality().equals;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    selectedRadio = 0;
    loadData();
  }

  loadData() async {
    //final restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
    //await restaurantProvider.loadData();
  }

  Widget _buildMenuItem(BuildContext context, QuestionChoice questionChoice, Order order, ModuleQuestion question) {
    return Consumer<ChoiceProvider>(
        builder: (context, restaurantProvider, _) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 170.0,
            width: 170.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          Container(
            height: 170.0,
            width: 170.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                tileMode: TileMode.mirror,
                stops: const <double>[0.1, 0.5, 0.7, 0.9],
                colors: <Color>[
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
              ),
            ),
          ),
          new GestureDetector(
          onTap: (){
          print("Container clicked");
          },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
          widget.moduleQuestion!.questiontype! == "multiple-answer" ?
          Expanded(
                child: CheckboxListTile(
                  contentPadding:  EdgeInsets.all(8),
                  title: Text(
                    questionChoice.choice!,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                  value: questionChoice.isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      questionChoice.isChecked = value!;
                      questionChoice.isCorrect =  value!;
                    });
                    List<int?> correctindexes =question.choices!.where((i) => i.isCorrect!).map((e) => e.choiceIndex).toList();
                    eq(correctindexes, question.correct) ? question.finalExamStatus = "exam_marked_correct":  question.finalExamStatus = "exam_marked_incorrect";
                    print("EQ:1 ${correctindexes} 2: ${question.correct} 3: ${ question.finalExamStatus} 4: ${eq(correctindexes, question.correct)}");
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                )
          ):
          Expanded(
          child: RadioListTile(
            title: Text(questionChoice.choice!), // Display the title for option 3
            subtitle: Text('Select choice'), // Display a subtitle for option 3
            value: questionChoice.choiceIndex!, // Assign a value of 3 to this option
            groupValue: selectedRadio, // Use _selectedValue to track the selected option
            onChanged: (int? value) {
              setState(() {
                selectedRadio = value;
                questionChoice.selected = value;
                selectedRadio == questionChoice.choiceIndex? questionChoice.isChecked = true: questionChoice.isChecked = false;
                question.correct!.contains(value) ? questionChoice.isCorrect = true:  questionChoice.isCorrect = false;
                question.correct!.contains(value) ? question.finalExamStatus = "exam_marked_correct":  question.finalExamStatus = "exam_marked_incorrect";
                print("Question correct? 1 ${question.correct} 2: ${value} 3: ${questionChoice.choice} 4: ${questionChoice.isCorrect} 5: ${question.finalExamStatus}");
              });
            },
              selected: questionChoice.selected == questionChoice.choiceIndex,
              activeColor: Colors.red,
          ),
          ),
              ],
            ),
          ),
          Positioned(
            bottom: 15.0,
            right: 15.0,
            child: Container(
              height: 36.0,
              width: 36.0,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.35),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                onPressed: () {
                  //restaurantProvider.addToCart(menuItem, widget.tutor!);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16.4,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  ChangeNotifierProvider<ChoiceProvider>(
        create: (_) => ChoiceProvider(),
    child: Scaffold(
	  resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.moduleQuestion!.imageUrl!,
                child: Opacity(
                  opacity: 0.95,
                  child: Image.asset(
                    widget.moduleQuestion!.imageUrl!,
                    height: 200.0,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                      Consumer<ChoiceProvider>(
                      builder: (context, examSetupProvider, _) {
                      return IconButton(
                        onPressed: () {
                          examSetupProvider.toggleFavorite();
                        },
                        icon: examSetupProvider.isFav
                            ? const Icon(
                                Icons.favorite,
                                size: 30.0,
                                color: Color(0xFF86DE29),
                              )
                            : const Icon(
                                Icons.favorite_border_sharp,
                                size: 30.0,
                                color: Color(0xFF86DE29),
                              ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Module: ${widget.moduleQuestion!.questiontext!}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                RatingStars(widget.moduleQuestion!.rating!),
                const SizedBox(height: 6.0),
                Text(
                  '${widget.moduleQuestion!.questiontype}',
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text('Reviews'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).primaryColor,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Contact'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => const Color(0xFF86DE29)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Center(
            child: Text(
              'CHOICES',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 11),
              itemCount: widget.moduleQuestion!.choices!.length,
              itemBuilder: (context, index) {
                QuestionChoice questionChoice = widget.moduleQuestion!.choices![index];
                Order order = Order();
                return _buildMenuItem(context, questionChoice, order, widget.moduleQuestion!);
              },
            ),
          ),
        ],
      ),
    ));
  }
}

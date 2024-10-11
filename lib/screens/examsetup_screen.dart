import 'package:flutter/material.dart';
import 'package:lesson_delivery_app_ui/database/db_helper.dart';
import 'package:lesson_delivery_app_ui/model/courseModule.dart';
import 'package:lesson_delivery_app_ui/model/examSetup.dart';
import 'package:lesson_delivery_app_ui/model/food.dart';
import 'package:lesson_delivery_app_ui/model/order.dart';
import 'package:lesson_delivery_app_ui/screens/exam_screen.dart';
import 'package:lesson_delivery_app_ui/widgets/rating_stars.dart';
import 'package:provider/provider.dart';
import '../Provider/examsetup_screen_provider.dart';
import '../Provider/exam_screen_provider.dart';

class ExamSetupScreen extends StatefulWidget {
  final CourseModule? courseModule;

  const ExamSetupScreen({this.courseModule, Key? key}) : super(key: key);

  @override
  State<ExamSetupScreen> createState() => _ExamSetupScreenState();
}

class _ExamSetupScreenState extends State<ExamSetupScreen> {
  DatabaseHelper? databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    loadData();
  }

  loadData() async {
    //final restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
    //await restaurantProvider.loadData();
  }

  Widget _buildMenuItem(BuildContext context, ExamSetup examSetup, Order order) {
    return Consumer<ExamSetupProvider>(
        builder: (context, restaurantProvider, _) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 170.0,
            width: 170.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: AssetImage(examSetup.imageUrl!),
                opacity: 0.88,
                fit: BoxFit.cover,
              ),
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
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        QuestionScreen(examSetup: examSetup)),
              );
            },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                examSetup.title!,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                  'Questions: ${examSetup.questions!.length.toString()}',
                  style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.0,
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
    return  ChangeNotifierProvider<ExamSetupProvider>(
        create: (_) => ExamSetupProvider(),
    child: Scaffold(
	  resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.courseModule!.imageUrl!,
                child: Opacity(
                  opacity: 0.95,
                  child: Image.asset(
                    widget.courseModule!.imageUrl!,
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
                      Consumer<ExamSetupProvider>(
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
                      'Module: ${widget.courseModule!.name!}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                RatingStars(widget.courseModule!.rating!),
                const SizedBox(height: 6.0),
                Text(
                  'R${widget.courseModule!.price}',
                  style: const TextStyle(
                    fontSize: 12.0,
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
              'EXAMS',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
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
              itemCount: widget.courseModule!.examSetups!.length,
              itemBuilder: (context, index) {
                ExamSetup examSetup = widget.courseModule!.examSetups![index];
                Order order = Order();
                return _buildMenuItem(context, examSetup, order);
              },
            ),
          ),
        ],
      ),
    ));
  }
}

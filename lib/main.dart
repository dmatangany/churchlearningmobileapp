import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:lesson_delivery_app_ui/screens/introduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
      '{publishable-key}';

  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gideon Bible Church: Tutorial Delivery App',
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.red,
        unselectedWidgetColor: Colors.blue,
      ),
      home: const IntroductionScreen(),
    );
  }
}

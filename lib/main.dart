import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veggie_mart/Pages/List_Page.dart';
import 'package:veggie_mart/Pages/onboardingscreen.dart';
import 'package:veggie_mart/Pages/SignInPage.dart';
import 'package:veggie_mart/Services/AuthNotifier.dart';
import 'package:veggie_mart/Services/FoodNotifier.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => FoodNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? List_Page() : SignInScreen();
        },
      ),
    );
  }
}


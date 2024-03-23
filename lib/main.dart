import 'package:crud/pages/add_name_page.dart';
import 'package:crud/pages/edit_name_page.dart';
import 'package:flutter/material.dart';

//importaciones Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/add": (context) => const AddNamePage(),
        "/edit": (context) => const EditNamePage(),
      },
    );
  }
}

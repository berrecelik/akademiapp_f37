import 'package:akademiapp_teamf37/sayfalar/haber_page.dart';
import 'package:akademiapp_teamf37/sayfalar/link_page.dart';
import 'package:akademiapp_teamf37/sayfalar/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => MainPage(),
      '/Flutter/Link': (context) => LinkPage(),
      '/Tasarım/Link': (context) => LinkPage(),
      '/Unity/Link': (context) => LinkPage(),
      '/Flutter/Haber': (context) => HaberPage(),
      '/Tasarım/Haber': (context) => HaberPage(),
      '/Unity/Haber': (context) => HaberPage(),
      '/Girişimcilik/Link': (context) => LinkPage(),
      '/Girişimcilik/Haber': (context) => HaberPage(),
      '/ProjeYönetimi/Link': (context) => LinkPage(),
      '/ProjeYönetimi/Haber': (context) => HaberPage(),
    });
  }
}

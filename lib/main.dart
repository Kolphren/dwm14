  
import 'package:dwm14/routes.dart';
import 'package:dwm14/screens/error.dart';
import 'package:dwm14/screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/firebase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder( // CupertinoApp(), WidgetApp()
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData (
              primarySwatch: Colors.deepPurple,
            ),
            routes: routes,
            initialRoute: isLogged() != null ? '/home' : '/login',
          );
        }
      return LoadingScreen();
      },
    );
  }
}
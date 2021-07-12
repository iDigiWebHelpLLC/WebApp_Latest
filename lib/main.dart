import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mywebflutterapp/screens/splashscreen.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/theme.dart';

//import 'screens/splashscreen.dart';
//void main() => runApp(MyApp());
Future<void> main() async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(CustomColours.appred);
    WidgetsFlutterBinding.ensureInitialized();
    //await Firebase.initializeApp();
  }  catch (e) {
    print(e);
  }
  runApp(MyApp(
  ));
}
class MyApp extends StatelessWidget {
  ThemeData theme = getApplicationTheme();
 // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
   /* return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('fireStoreError');
          return Center(child: Text('fireStoreError'),);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print('fireStoreConnected');
          return Center(child: Text('fireStoreConnected'),);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print('fireStoreSomething');
        return Center(child: Text('fireStoreSomething'),);
      },
    );*/
    return MaterialApp(theme: theme, home: SplashScreen());
  }
}
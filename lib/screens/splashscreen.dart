import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
//import 'package:my_mobile_service_app/screens/onboarding/user_onboarding.dart';
import 'package:mywebflutterapp/models/subscribers.dart';
import 'package:mywebflutterapp/screens/account.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
import 'onboarding/user_onboarding.dart';

//import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  initState() {
    loadTheHomePage();
    super.initState();
  }
  loadTheHomePage() async {
    //Fetch the data from the API
    Subscribers subscribers = await APIClient().getSubDetails();
    //Check if the user id is stored
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("id")) {
      //if the user is logged in
      Subscriber subscriber;
      int id = prefs.getInt("id");
      subscribers.subscribers.forEach((element) {
        if (element.id == id) {
          print('elementid ${id}');
          subscriber = element;
        }
      });
       //  print('elementid ${id}');
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(subscriber)));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserOnBoarding(subscriber)));
    } else {
      //if the user is not logged in
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(subscribers)));

    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //App Logo
          Container(width: MediaQuery.of(context).size.width, child: Image.asset("assets/images/logo.png",height: 150,width: 150,)),

          //App Name
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text("My Service App", style: theme.textTheme.headline6),
          // ),
        ],
      ),
    );
  }
}

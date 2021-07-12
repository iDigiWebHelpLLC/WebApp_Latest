import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/screens/plans.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'account.dart';
import 'migrates/transition_migration.dart';

class HomeScreen extends StatefulWidget {
  final Subscriber subscriber;
  HomeScreen(this.subscriber);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOdd = false;
  double width, height;
  bool isTabulateWidth,isMobileWidth,isDesktopWidth;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    isTabulateWidth =   (MediaQuery.of(context).size.width < 800);
    isMobileWidth =   (MediaQuery.of(context).size.width < 600);
    isDesktopWidth =   (MediaQuery.of(context).size.width < 1000);
    height = MediaQuery.of(context).size.height;
    print('sizes ${width}');

    if ( (MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
        /* endDrawer: Drawer(
        child: Container(
          color: Color(0xff2b2f30),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              //Header
              DrawerHeader(child: Text("My Mobile service App"), decoration: BoxDecoration(color: Colors.red)),

              ListTile(
                title: Text("Device Manual", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceManuals()));
                },
              ),
              ListTile(
                title: Text("Blog", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Online Donations", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),*/
        //Body
        //body: AccountScreen(widget.subscriber),
          body:Container(
            padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                new Positioned(
                  top: 0,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    children: [
                      Container(
                        color: CustomColours.appred,
                        height: 45,
                        width: width,
                        child: IconButton(
                            icon: Image.asset("assets/images/Patriot_Mark_White.png",),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      AppBar(
                        centerTitle: true,
                        title: Text(
                          "PATRIOT MOBILE",
                          //"Hello " + widget.subscriber.firstName,
                          style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 20),
                          textAlign: TextAlign.end,
                        ),
                        iconTheme: IconThemeData(color: CustomColours.arealRagularGrey),
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 110),
                  child:  homeScreen(theme),
                )
              ],
            ),
          )

      );
    } else if ( (MediaQuery.of(context).size.width > 650&& MediaQuery.of(context).size.width < 800)) {
      return Scaffold(
        /* endDrawer: Drawer(
        child: Container(
          color: Color(0xff2b2f30),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              //Header
              DrawerHeader(child: Text("My Mobile service App"), decoration: BoxDecoration(color: Colors.red)),

              ListTile(
                title: Text("Device Manual", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceManuals()));
                },
              ),
              ListTile(
                title: Text("Blog", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Online Donations", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),*/
        //Body
        //body: AccountScreen(widget.subscriber),
          body:Container(
            padding: EdgeInsets.only(left: width/12,right: width/12),
            child: Stack(
              children: [
                new Positioned(
                  top: 0,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    children: [
                      Container(
                        color: CustomColours.appred,
                        height: 45,
                        width: width,
                        child: IconButton(
                            icon: Image.asset("assets/images/Patriot_Mark_White.png",),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      AppBar(
                        centerTitle: true,
                        title: Text(
                          "PATRIOT MOBILE",
                          //"Hello " + widget.subscriber.firstName,
                          style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 20),
                          textAlign: TextAlign.end,
                        ),
                        iconTheme: IconThemeData(color: CustomColours.arealRagularGrey),
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 110),
                  child:  homeScreen(theme),
                )
              ],
            ),
          )

      );
    }  else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
        /* endDrawer: Drawer(
        child: Container(
          color: Color(0xff2b2f30),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              //Header
              DrawerHeader(child: Text("My Mobile service App"), decoration: BoxDecoration(color: Colors.red)),

              ListTile(
                title: Text("Device Manual", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceManuals()));
                },
              ),
              ListTile(
                title: Text("Blog", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Online Donations", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),*/
        //Body
        //body: AccountScreen(widget.subscriber),
          body:Container(
           // padding: EdgeInsets.only(left: width/10,right: width/10),
            child: Stack(
              children: [
                new Positioned(
                  top: 0,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    children: [
                      Container(
                        color: CustomColours.appred,
                        height: 45,
                        width: width,
                        child: IconButton(
                            icon: Image.asset("assets/images/Patriot_Mark_White.png",),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      AppBar(
                        centerTitle: true,
                        title: Text(
                          "PATRIOT MOBILE",
                          //"Hello " + widget.subscriber.firstName,
                          style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 20),
                          textAlign: TextAlign.end,
                        ),
                        iconTheme: IconThemeData(color: CustomColours.arealRagularGrey),
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 110),
                  child:  homeScreen(theme),
                )
              ],
            ),
          )

      );
    }

  }
  ///Get the Home screen Feed
  homeScreen(ThemeData theme) {
    return Container(

      child: ListView(
        children: [

          Align(
            alignment: Alignment.topCenter,
            child:Image.asset("assets/images/Eagle.jpg",),
          ),
          //Your Bill
          getFeedCard(
            theme,
            "View the Bill",
            "View your current and all your past bills",
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
            },
          ),
        Divider(indent: 0, thickness: 12, endIndent: 0),
          //Your Plan
          getFeedCard(
            theme,
            "View your Plan",
            "View your current Plan",
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PlansScreen(widget.subscriber)));
            },
          ),

          Divider(indent: 0, thickness: 12, endIndent: 0),
          //Manage your device protection
          getFeedCard(
            theme,
            "device tutorial",
            "View your device tutorial",
                () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceManuals()));
                },
          ),
          Divider(indent: 0, thickness: 12, endIndent: 0),
          //Manage your device protection
          getFeedCard(
            theme,
            "Loyalty  Upgrade",
            "View your Migration/Transition",
                () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransitionMigration(subscriber:widget.subscriber)));
                },
          ),
          Divider(indent: 0, thickness: 12, endIndent: 0),
          //Share your two cents
          getFeedCard(
            theme,
            "Share your two cents",
            "We'd love your feedback on the app.",
            () {
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => HelpOnceSimCardPortComlete()));
             //Navigator.push(context, MaterialPageRoute(builder: (context) => Important()));
              //Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyDetails()));
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => TransitionMigration()));
             // Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerification()));

            },
          ),
          Divider(indent: 0, thickness: 12, endIndent: 0),
          //Manage your device protection
          getFeedCard(
            theme,
            "Manage your device protection",
            "You have device protection. It includes 24/7 expert test coach support for technical questions about your device.",
            () {
              //TODO: Do something here
            },
          ),
        ],
      ),

    );
  }

  ///Get the individual feed card
  getFeedCard(ThemeData theme, String title, String desc, VoidCallback onTap) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:checkEvenOdd()?Text(title, style: theme.textTheme.headline4.copyWith(color: CustomColours.samidarkRed,fontSize: 20)):
              Text(title, style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 20)),
            ),
            //Description
            Container(
              padding: const EdgeInsets.all(8.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 Flexible(
                   child:  Text(desc, style: theme.textTheme.headline6.copyWith(color: CustomColours.arealRagularGrey,fontSize: 16),
                  ),
                 ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.chevron_right, size: 48),
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
  bool checkEvenOdd() {
    isOdd = !isOdd;
    print('EvenOdd ${isOdd}');
    return  isOdd;


    /* if (indexNumber % 2 != 0) {
      print('isOdd ${indexNumber % 2}');
      return 1;
    }else{
      print('isEven ${indexNumber % 2}');
      return 0;
      *//* x is odd *//*
    }*/
  }
}

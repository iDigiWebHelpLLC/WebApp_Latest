import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mywebflutterapp/messaging.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/models/subscriber_detail.dart';
import 'package:mywebflutterapp/models/subscriber_statement.dart';
import 'package:mywebflutterapp/screens/migrates/transition_migration.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';

import '../account.dart';
import '../homescreen.dart';
import '../web_home.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class UserOnBoarding extends StatefulWidget {
  Subscriber subscriber;

  UserOnBoarding(this.subscriber);

  @override
  _UserOnBoardingState createState() => _UserOnBoardingState();
}

class _UserOnBoardingState extends State<UserOnBoarding> {


  final _messaging = Messaging.instance;






  static const pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,color: Color.fromRGBO(182, 39, 62, 1),fontFamily: 'Montserrat',),
    bodyTextStyle: TextStyle(fontSize: 18.0,color: Color.fromRGBO(157, 159, 161, 1),),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    imagePadding: EdgeInsets.only(top: 0),
    pageColor: Colors.white,
  );
  List<PageViewModel> lstPages = [
    //Page 1
    PageViewModel(
      //title: "Your Account. All in one place",
      title: 'Your Account. All in one place.',
      body: "Managing your account has never been easier. Devices, plans, data and more!",
      image: Image.asset("assets/images/app_phone_plans-devices.png"),
      // image:SvgPicture.asset("assets/images/app_phone_plans-devices.svg"),
      decoration: pageDecoration,
    ),

    //Page 2
    /*PageViewModel(
      title: "Shop and Upgrade in minutes",
      body: "The faster way to get what you want",
      image: Image.asset("assets/images/app_phone_plans-customize.png"),
      decoration: pageDecoration,
    ),*/

    //Page 3
    /*PageViewModel(
      title: "On- Demand support",
      body: "Smart support that's with you every step of the way",
      image: Image.asset("assets/images/app_phone_plans-support.png"),
      decoration: pageDecoration,
    ),*/

    //Page 4
    PageViewModel(
      title: "Your bill, simplified.",
      body: "Easy to understand, Easy to pay.",
      image: Image.asset("assets/images/app_phone_bill.png"),
      decoration: pageDecoration,
    ),
  ];
  bool isdialog = false;
  double width, height;
  String appbarTitle = 'Welcome';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messaging.init().then((value) => requests());
    _messaging.stream.listen(
          (event) {
        print('NewMessage: ${event}');
      },
    );
    getLoyaltyDetailsDialog(widget.subscriber);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    if ( (MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body: Container(
            padding: EdgeInsets.only(left: width/6,right: width/6),

            child:   FutureBuilder<Map>(
              future: getAllDetails(widget.subscriber),
              builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                if (snapshot.connectionState == ConnectionState.waiting) return Center(child: Container(color: Colors.transparent,));
                if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));

                LinesDetailEntity linesDetail = snapshot.data["linesDetail"];
                SubscriberDetail subscriberDetail = snapshot.data["subscriberDetail"];
                BillingStatements billingStatements = snapshot.data["billingStatement"];



                return  Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 50),
                      child: IntroductionScreen(
                        pages: lstPages,
                        onDone: () {
                          //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                        },
                        onSkip: () {
                          //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                        },
                        showSkipButton: true,
                        skip: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 16),),
                        next: const Icon(Icons.navigate_next,size: 50,),
                        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 16)),
                        dotsDecorator: DotsDecorator(
                            size: const Size.square(12.0),
                            activeSize: const Size(25.0, 12.0),
                            activeColor: Theme.of(context).accentColor,
                            color: Colors.black,
                            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                      ),
                    ),
                    new Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 15.0,
                        child: Column(
                          children: [
                            Container(
                              //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                              alignment:Alignment.bottomCenter,
                              height:4.0,
                              width:width,
                              color:CustomColours.lightGrey,
                            ),
                            SizedBox(height: height/45,),
                            Text(
                              'Copyright © 2021 patriotmobile - Patriot Mobile, Patriot Mobile Mobilizing Conservatives, Patriot Mobile Mobilizing Freedom are trademarks or registered trademarks of Patriot Mobile LLC.',
                              style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                              textAlign: TextAlign.center,

                            ),

                          ],
                        )
                    ),
                  ],
                );
              },
            ),


          )

      );
    } else if ( (MediaQuery.of(context).size.width > 650&& MediaQuery.of(context).size.width < 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body: Container(
            padding: EdgeInsets.only(left: width/12,right: width/12),

            child:   FutureBuilder<Map>(
              future: getAllDetails(widget.subscriber),
              builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                if (snapshot.connectionState == ConnectionState.waiting) return Center(child: Container(color: Colors.transparent,));
                if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));

                LinesDetailEntity linesDetail = snapshot.data["linesDetail"];
                SubscriberDetail subscriberDetail = snapshot.data["subscriberDetail"];
                BillingStatements billingStatements = snapshot.data["billingStatement"];

                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 50),
                      child: IntroductionScreen(
                        pages: lstPages,
                        onDone: () {
                          //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                        },
                        onSkip: () {
                          //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                        },
                        showSkipButton: true,
                        skip: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 16),),
                        next: const Icon(Icons.navigate_next,size: 50,),
                        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 16)),
                        dotsDecorator: DotsDecorator(
                            size: const Size.square(12.0),
                            activeSize: const Size(25.0, 12.0),
                            activeColor: Theme.of(context).accentColor,
                            color: Colors.black,
                            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                      ),
                    ),
                    new Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 15.0,
                        child: Column(
                          children: [
                            Container(
                              //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                              alignment:Alignment.bottomCenter,
                              height:4.0,
                              width:width,
                              color:CustomColours.lightGrey,
                            ),
                            SizedBox(height: height/45,),
                            Text(
                              'Copyright © 2021 patriotmobile - Patriot Mobile, Patriot Mobile Mobilizing Conservatives, Patriot Mobile Mobilizing Freedom are trademarks or registered trademarks of Patriot Mobile LLC.',
                              style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                              textAlign: TextAlign.center,

                            ),

                          ],
                        )
                    ),
                  ],
                );
              },
            ),

          )

      );
    }  else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body: Container(
            //padding: EdgeInsets.only(left: width/6,right: width/6),


            child:   FutureBuilder<Map>(
              future: getAllDetails(widget.subscriber),
              builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                if (snapshot.connectionState == ConnectionState.waiting) return Center(child: Container(color: Colors.transparent,));
                if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));

                LinesDetailEntity linesDetail = snapshot.data["linesDetail"];
                SubscriberDetail subscriberDetail = snapshot.data["subscriberDetail"];
                BillingStatements billingStatements = snapshot.data["billingStatement"];

                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 50),
                      child: IntroductionScreen(
                        pages: lstPages,
                        onDone: () {
                          //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                        },
                        onSkip: () {
                          //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
                        },
                        showSkipButton: true,
                        skip: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 16),),
                        next: const Icon(Icons.navigate_next,size: 50,),
                        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 16)),
                        dotsDecorator: DotsDecorator(
                            size: const Size.square(12.0),
                            activeSize: const Size(25.0, 12.0),
                            activeColor: Theme.of(context).accentColor,
                            color: Colors.black,
                            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                      ),
                    ),
                    new Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 15.0,
                        child: Column(
                          children: [
                            Container(
                              //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                              alignment:Alignment.bottomCenter,
                              height:4.0,
                              width:width,
                              color:CustomColours.lightGrey,
                            ),
                            SizedBox(height: height/45,),
                            Text(
                              'Copyright © 2021 patriotmobile - Patriot Mobile, Patriot Mobile Mobilizing Conservatives, Patriot Mobile Mobilizing Freedom are trademarks or registered trademarks of Patriot Mobile LLC.',
                              style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                              textAlign: TextAlign.center,

                            ),

                          ],
                        )
                    ),
                  ],
                );
              },
            ),

          )

      );
    }
  }

  Future<void> requests() async {
    _messaging.requestPermission().then((_) async {
      final _token = await _messaging.getToken();
      print('Token: $_token');
    });
  }

  ///Get all the values fetched from the API
  Future<Map> getAllDetails(Subscriber subscriber) async {
    print('subscriberIDforMigration :-  ${subscriber.id.toString()}');
    //Load the line and the subscriber detail
    LinesDetailEntity linesDetail = await getLinesData(subscriber);

    print('migrationLinedata :-  ${linesDetail.lines[0].id}');
    print('migrationLinedataLength :-  ${linesDetail.lines.length}');
    SubscriberDetail subscriberDetail = await getSubscriberData(subscriber);
    //Load the billing details from the "current_billing_statement_id" field from the subscriber API
    BillingStatements billingStatements = await getBillingStatement(subscriberDetail.currentBillingStatementId.toString());

    for(int lineItemIndex=0;lineItemIndex<linesDetail?.lines?.length;lineItemIndex++) {
      if (linesDetail.lines[lineItemIndex].status == "active") {
        if (linesDetail.lines[lineItemIndex].attributeValues.x77 != null &&
            linesDetail.lines[lineItemIndex].attributeValues.x77 == 'Needs Transition'||
            linesDetail.lines[lineItemIndex].attributeValues.x77 == 'Completed Transition') {
        }else{
          // isDisplayMigrationButton = false;
        }
      }
    }
    //Return the data
    return {
      "linesDetail": linesDetail,
      "subscriberDetail": subscriberDetail,
      "billingStatement": billingStatements,
    };
  }


  ///Get detail for dialog
  Future<Map> getLoyaltyDetailsDialog(Subscriber subscriber) async {
    print('subscriberIDforMigration :-  ${subscriber.id.toString()}');
    //Load the line and the subscriber detail
    LinesDetailEntity linesDetail = await getLinesData(subscriber);

    print('migrationLinedata :-  ${linesDetail.lines[0].id}');
    print('migrationLinedataLength :-  ${linesDetail.lines.length}');
    SubscriberDetail subscriberDetail = await getSubscriberData(subscriber);
    //Load the billing details from the "current_billing_statement_id" field from the subscriber API
    BillingStatements billingStatements = await getBillingStatement(subscriberDetail.currentBillingStatementId.toString());

    for(int lineItemIndex=0;lineItemIndex<linesDetail?.lines?.length;lineItemIndex++) {
      if (linesDetail.lines[lineItemIndex].status == "active") {
        if (linesDetail.lines[lineItemIndex].attributeValues.x77 != null &&
            linesDetail.lines[lineItemIndex].attributeValues.x77 == 'Needs Transition'||
            linesDetail.lines[lineItemIndex].attributeValues.x77 == 'Completed Transition') {
          isdialog = true;
        }else{
          // isDisplayMigrationButton = false;
        }
      }
    }
    if (isdialog) {
      displayDialog( context);
    }
    //Return the data
    return {
      "linesDetail": linesDetail,
      "subscriberDetail": subscriberDetail,
      "billingStatement": billingStatements,
    };
  }
  displayDialog(BuildContext context) {
    showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              content:Container(
                width:width-500,
                height:height- 200,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      // image: new AssetImage("assets/images/dialogimage.png"),
                      image: new AssetImage("assets/images/dialog_web.png"),
                      fit: BoxFit.fill,
                    )
                ),
                child:Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    /*  Align(
                      alignment: Alignment.center,
                      child: Text(" Learn more goes to Loyalty Upgrade"),
                    ),*/
                    Positioned(
                      right: -20.0,
                      top: -30.0,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pop();
                            isdialog = false;
                          });
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Form(
                        child:  Container(
                          alignment: Alignment.bottomRight,
                          // color: Colors.amber[colorCodes[index]],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: CustomColours.lightGrey,
                              child: Text('Learn more',style: TextStyle(color: Colors.black),),
                              onPressed: () {
                                isdialog = false;
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransitionMigration(subscriber:widget.subscriber)));
                              },
                            ),
                          ),
                        )
                    ),

                  ],
                ),
              )
          );
        }
    );


    /*  showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return  AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            title: Text(""),
            content: Text("Loyalty Upgrade"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                 // isdialog = false;
                },
                child: Text("ok"),
              ),
            ],
          );
        }
    );*/
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/screens/migrates/transition_migration.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpOnceSimCardPortComlete extends StatefulWidget {
  final Subscriber subscriber;
  HelpOnceSimCardPortComlete(this.subscriber,{Key key}) : super(key: key);

  @override
  _HelpOnceSimCardPortComleteState createState() =>
      _HelpOnceSimCardPortComleteState();
}

class _HelpOnceSimCardPortComleteState
    extends State<HelpOnceSimCardPortComlete> {
  double width, height;
  String appbarTitle = 'Loyalty Upgrade';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    if ( (MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          //Body
          body:Container(
            padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  height: height/1.7,
                  child: ListView(
                    children: [
                      SizedBox(height: 10,),
                      // Container(
                      //   alignment: Alignment.center,
                      //   child:Text('Free Loyalty Upgrade',
                      //     style: TextStyle(fontSize: 16,
                      //       fontWeight: FontWeight.bold,
                      //       color: CustomColours.appred,fontFamily: 'Montserrat',),
                      //   ),
                      // ),
                      SizedBox(height: 10,),
                       Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        child:Text('Free Loyalty Upgrade – Check Your Email',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                        alignment:Alignment.bottomCenter,
                        height:3.0,
                        width:width,
                        color:CustomColours.lightGrey,
                      ),

                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            // Container(
                            //   alignment: Alignment.centerLeft,
                            //   child:Text('Please refer to your email for next steps.',
                            //     textAlign: TextAlign.start,
                            //     style: TextStyle(fontSize: 16,
                            //         fontWeight: FontWeight.normal,
                            //         color: CustomColours.grayDark),
                            //   ),
                            // ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child:   RichText(
                                  text: TextSpan(
                                    text: '',
                                    children: <TextSpan>[
                                      TextSpan(text: 'Congratulations! Please check your email for confirmation you’ve been upgraded and entered in the drawing for a 1st class trip for two! Trip details ',style:TextStyle( fontWeight: FontWeight.bold,
                                        color: Colors.black,fontFamily: 'Montserrat',)),
                                      TextSpan(text: ' www.patriotmobile.com/vacation.', style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue,fontFamily: 'Montserrat',),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              const url = 'www.patriotmobile.com/vacation';
                                              launchURL(url);
                                            }
                                      ),
                                      TextSpan(text: '\n\nDo NOT insert your new SIM card before you receive your email confirmation.',
                                        style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),),
                                    ],
                                  ),
                                  textAlign:TextAlign.start
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Note :', style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                  textAlign: TextAlign.left, ),
                                SizedBox(height: 3,),
                                Expanded(
                                  child:Text('  Having trouble?. Call us on 740 – PATRIOT, M-F 9am-6pm CDT.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: CustomColours.darkBlue),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: RichText(
                                      text: TextSpan(
                                        text: 'More than one number? ',
                                        style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(text: 'Click ', style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,fontFamily: 'Montserrat',)),
                                          TextSpan(text: 'here ', style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.blue,fontFamily: 'Montserrat',),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransitionMigration(subscriber:widget.subscriber)));
                                                }
                                          ),
                                          TextSpan(text: 'to return to step 1. ',
                                            style: TextStyle(fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),),
                                        ],
                                      ),
                                      textAlign:TextAlign.center
                                  ),
                                )
                              ],
                            )
                          ],
                        ),

                      ),
                    ],
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

            ),
          )
      );
    } else if ( (MediaQuery.of(context).size.width > 650&& MediaQuery.of(context).size.width < 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          //Body
          body:Container(
            padding: EdgeInsets.only(left: width/12,right: width/12),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: height/1.7,
                  child: Column(
                    children: [
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        child:Text('Free Loyalty Upgrade',
                          style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            // Container(
                            //   alignment: Alignment.centerLeft,
                            //   child:Text('Please refer to your email for next steps.',
                            //     textAlign: TextAlign.start,
                            //     style: TextStyle(fontSize: 16,
                            //         fontWeight: FontWeight.normal,
                            //         color: CustomColours.grayDark),
                            //   ),
                            // ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child:   RichText(
                                  text: TextSpan(
                                    text: '',
                                    children: <TextSpan>[
                                      TextSpan(text: 'Congratulations! Please check your email for confirmation you’ve been upgraded and entered in the drawing for a 1st class trip for two! Trip details ',style:TextStyle( fontWeight: FontWeight.bold,
                                        color: Colors.black,fontFamily: 'Montserrat',)),
                                      TextSpan(text: 'www.patriotmobile.com/vacation.', style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue,fontFamily: 'Montserrat',),
                                        recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  const url = 'www.patriotmobile.com/vacation';
                                                  launchURL(url);
                                                }

                                      ),
                                      TextSpan(text: '\n\nDo NOT insert your new SIM card before you receive your email confirmation.',
                                        style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),),
                                    ],
                                  ),
                                  textAlign:TextAlign.start
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Note :', style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                  textAlign: TextAlign.left, ),
                                SizedBox(height: 3,),
                                Expanded(
                                  child:Text('  Having trouble? Call us on 740 - PATRIOT, M-F 9am-9pm CTD.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: CustomColours.darkBlue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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

            ),
          )
      );
    }  else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          //Body
          body:Container(
           // padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: height/1.7,
                  child: Column(
                    children: [
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        child:Text('Free Loyalty Upgrade',
                          style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Flexible(
                        child:Container(
                          margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                      ),

                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            // Container(
                            //   alignment: Alignment.centerLeft,
                            //   child:Text('Please refer to your email for next steps.',
                            //     textAlign: TextAlign.start,
                            //     style: TextStyle(fontSize: 16,
                            //         fontWeight: FontWeight.normal,
                            //         color: CustomColours.grayDark),
                            //   ),
                            // ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child:
                              RichText(
                                  text: TextSpan(
                                    text: '',
                                    children: <TextSpan>[
                                      TextSpan(text: 'Congratulations! Please check your email for confirmation you’ve been upgraded and entered in the drawing for a 1st class trip for two! Trip details ',style:TextStyle( fontWeight: FontWeight.bold,
                                        color: Colors.black,fontFamily: 'Montserrat',)),
                                      TextSpan(text: 'www.patriotmobile.com/vacation', style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue,fontFamily: 'Montserrat',),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              const url = 'www.patriotmobile.com/vacation';
                                              launchURL(url);
                                            }

                                      ),
                                      TextSpan(text: '\nDo NOT insert your new SIM card before you receive your email confirmation.',
                                        style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),),
                                    ],
                                  ),
                                  textAlign:TextAlign.start
                              ),

                              // Text('Congratulations! Please Check your email for confirmation you have been upgraded and entered in the drawing for  a 1st class trip for two! trip details \n  '
                              //     'Do Not insert your new SIM card before you receive your email confirmation.',
                              //   textAlign: TextAlign.start,
                              //   style: TextStyle(fontSize: 16,
                              //       fontWeight: FontWeight.normal,
                              //       color: CustomColours.darkBlue),
                              // ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Note :', style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                  textAlign: TextAlign.left, ),
                                SizedBox(height: 3,),
                                Expanded(
                                  child:Text('  Having trouble? Call us on 740 - PATRIOT, M-F 9am-9pm CTD.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: CustomColours.darkBlue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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

            ),
          )
      );
    }


    return Scaffold(
      appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
      //Body
      body:Container(
        padding: EdgeInsets.only(left: width/6,right: width/6),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              height: height/1.7,
              child: Column(
                children: [
                  Flexible(
                    child:Container(
                      margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                      alignment:Alignment.bottomCenter,
                      height:3.0,
                      width:width,
                      color:CustomColours.lightGrey,
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    child:Text('Free Loyalty Upgrade',
                      style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Flexible(
                    child:Container(
                      margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                      alignment:Alignment.bottomCenter,
                      height:3.0,
                      width:width,
                      color:CustomColours.lightGrey,
                    ),
                  ),

                  SizedBox(height: 30,),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child:Text('Please refer to your email for next steps..',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: CustomColours.grayDark),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child:   RichText(
                              text: TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  TextSpan(text: 'Congratulations! Please check your email for confirmation you’ve been upgraded and entered in the drawing for a 1st class trip for two! Trip details ',style:TextStyle( fontWeight: FontWeight.bold,
                                    color: Colors.black,fontFamily: 'Montserrat',)),
                                  TextSpan(text: ' www.patriotmobile.com/vacation.', style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,fontFamily: 'Montserrat',),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          const url = 'www.patriotmobile.com/vacation';
                                          launchURL(url);
                                        }

                                  ),
                                  TextSpan(text: '\n\nDo NOT insert your new SIM card before you receive your email confirmation.',
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),),
                                ],
                              ),
                              textAlign:TextAlign.start
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Note :', style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                              textAlign: TextAlign.left, ),
                            SizedBox(height: 3,),
                            Expanded(
                              child:Text('  Having trouble? Call us on 740 - PATRIOT, M-F 9am-9pm CTD.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkBlue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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

        ),
      )
    );
  }
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }


}
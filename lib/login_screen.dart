import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/models/subscribers.dart';
import 'package:mywebflutterapp/screens/account.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding/user_onboarding.dart';



//Come back to 31.25 in the video to see how to define the navigator page etc.


//TEST USER CREDENTIALS
//id = 24
//everett@trostcs.com
//applerum
//  {
//    "id": 24,
//    "links": {
//      "addresses": "/addresses?by_subscriber_id=24",
//      "comments": "/comments?by_subscriber_id=24",
//      "contacts": "/contacts?by_subscriber_id=24",
//      "credit_cards": "/credit_cards?by_subscriber_id=24",
//      "discounts": "/discounts?by_subscriber_id=24&cache_buster=1598194369.9559476",
//      "event_logs": "/event_logs?by_subscriber_id=24",
//      "invoices": "/invoices?by_subscriber_id=24",
//      "lines": "/lines?by_subscriber_id=24",
//      "order_details": "/order_details?by_subscriber_id=24",
//      "payment_processor_requests": "/payment_processor_requests?by_subscriber_id=24",
//      "referred_subscribers": "/subscribers?by_referrer=24",
//      "security_answers": "/security_answers?by_subscriber_id=24",
//      "subscriber_payment_plans": "/subscriber_payment_plans?by_subscriber_id=24"
//    },
//    "meta": {
//      "attribute_titles": {}
//    },
//    "account_pin": "applerum",
//    "account_type": "business",
//    "activated_at": "2019-04-04T20:44:59.798Z",
//    "affiliate_id": 13,
//    "attribute_values": {},
//    "autopay_enrolled_at": null,
//    "company_id": 17,
//    "contact_number": "6828882698",
//    "created_at": "2019-04-03T16:18:45.333Z",
//    "credit_score_updated_at": null,
//    "credit_score": null,
//    "date_of_birth": null,
//    "deactivated_at": null,
//    "email": "everett@trostcs.com",
//    "first_name": null,
//    "last_name": null,
//    "magnetic_user_created_at": null,
//    "name": "Trost Consulting",
//    "organization_name": "Trost Consulting",
//    "referrer_subscriber_id": 20,
//    "send_emails": true,
//    "send_texts": true,
//    "ssn_last_four": null,
//    "state": "active",
//    "tax_exemption_code_id": 1,
//    "time_zone": "Central Time (US & Canada)",
//    "updated_at": "2020-08-16T05:00:03.893Z",
//    "uuid": "2789519a-562c-11e9-ad60-93ee461e5607",
//    "autopay_enrolled": false,
//    "company_profile_id": 11,
//    "current_balance": "0.00",
//    "current_billing_statement_id": 74,
//    "current_due_at": "2020-08-21T05:00:00.000Z",
//    "deposit_balance": "0.00",
//    "past_due_at": "2020-08-21T05:00:00.000Z",
//    "past_due_balance": "52.82",
//    "primary_line_id": 96,
//    "total_balance": "52.82",
//    "total_credit_balance": "0.00"
//  }

class LoginScreen extends StatefulWidget {
  Subscribers subscribers;

  LoginScreen(this.subscribers);

  @override
  State<StatefulWidget> createState() => _LogScreen();
}

class _LogScreen extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  double width, height;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    if ( (MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
          key: scaffoldKey,
          body:Container(
              padding: EdgeInsets.only(left: width/6,right: width/6),
              child:Stack(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 80),
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage("assets/images/login_bck.png",),
                              fit: BoxFit.cover)
                      ),
                      child: ListView(
                        padding: EdgeInsets.all(10),
                        children: <Widget>[
                          SizedBox(height: 50,),
                          Container(
                            margin: EdgeInsets.only(top: 20,left: width/16,right: width/16),
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: emailController,
                              //decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'User Name'),
                              decoration: new InputDecoration(
                                filled: true,

                                fillColor: Colors.white,
                                hintText: 'Email',
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width/3,
                            margin: EdgeInsets.only(top: 10,left: width/16,right: width/16),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextField(
                              obscureText: true,
                              controller: passwordController,
                              // decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
                              decoration: new InputDecoration(
                                filled: true,fillColor: Colors.white,
                                hintText: 'Pin',
                                contentPadding: const EdgeInsets.only(
                                     left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        /*  FlatButton(
                            onPressed: () {
                              //forgot password screen
                            },
                            textColor: Color(0XFF414141),
                            child: Text('Forgot Password ?',style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                          ),*/

                          SizedBox(height:30),
                          //Login
                          Container(
                            height: 50,
                            width: width/3,
                            margin: EdgeInsets.only(top: 10,left: width/8,right: width/8),
                            child: Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(10.0),
                              color:CustomColours.samidarkRed,
                              child: MaterialButton(
                                // minWidth: width/2,
                                // padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                onPressed: () {
                                  //Check the username and password
                                  checkLoginCredentials();
                                },
                                child: Text('Login', textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Montserrat',)),
                              ),
                            ),
                          ),
                          /*  Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: theme.accentColor,
                    child: Text('Login'),
                    onPressed: () {
                      //Check the username and password
                      checkLoginCredentials();
                    },
                  ),
                ),*/

                          //Create Account
                          /* Row(
                  children: <Widget>[
                    Text('Create Account?'),
                    FlatButton(
                      textColor: Color(0XFF414141),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )*/
                        ],
                      ),
                    ),
                  ),
                  new Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          color: CustomColours.appred,
                          height: 50,
                          width: width,
                        /* child: Text("Patriot Mobile",
                           style: theme.textTheme.headline4.copyWith(color: Colors.white,fontSize: 20,),
                           textAlign: TextAlign.center,
                         ),*/
                          child: IconButton(
                              icon: Image.asset("assets/images/logo.png",color: Colors.white,),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width: 50,),
                            Align(
                              alignment: Alignment.center,
                              child:  Text(
                                "Patriot Mobile",
                                //"Hello " + widget.subscriber.firstName,
                                style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 24,),
                                textAlign: TextAlign.end,
                              ),
                            ),

                         /*   IconButton(
                                icon: Icon(Icons.dehaze_outlined,color:CustomColours.arealRagularGrey,),

                                onPressed: () {
                                  // Navigator.pop(context);
                                }),*/

                            Container(width: 50,),

                          ],
                        ),
                        /* AppBar(
                    centerTitle: true,
                    title:Container(
                      color: Colors.white,
                      width: width,
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
                      child:  Text(
                        "MY APP",
                        //"Hello " + widget.subscriber.firstName,
                        style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    iconTheme: IconThemeData(color: Colors.white),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),*/
                      ],
                    ),
                  ),
                ],
              )
          )
      );
    } else if ( (MediaQuery.of(context).size.width > 650&& MediaQuery.of(context).size.width < 800)) {
      return Scaffold(
          key: scaffoldKey,
          body:Container(
              padding: EdgeInsets.only(left: width/12,right: width/12),
              child:Stack(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 80),
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage("assets/images/Friends_beach.jpg",),
                              fit: BoxFit.cover)
                      ),
                      child: ListView(
                        padding: EdgeInsets.all(10),
                        children: <Widget>[
                          SizedBox(height: 50,),
                          Container(
                            margin: EdgeInsets.only(top: 20,left: width/16,right: width/16),
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: emailController,
                              //decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'User Name'),
                              decoration: new InputDecoration(
                                filled: true,

                                fillColor: Colors.white,
                                hintText: 'Email',
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10,left: width/16,right: width/16),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextField(
                              obscureText: true,
                              controller: passwordController,
                              // decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
                              decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Pin',
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          /*FlatButton(
                            onPressed: () {
                              //forgot password screen
                            },
                            textColor: Color(0XFF414141),
                            child: Text('Forgot Password ?',style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                          ),*/

                          SizedBox(height:30),
                          //Login
                          Container(
                            height: 50,
                            width: width/3,
                            margin: EdgeInsets.only(top: 10,left: width/8,right: width/8),
                            child: Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(10.0),
                              color:CustomColours.samidarkRed,
                              child: MaterialButton(
                                // minWidth: width/2,
                                // padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                onPressed: () {
                                  //Check the username and password
                                  checkLoginCredentials();
                                },
                                child: Text('Login', textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Montserrat',)),
                              ),
                            ),
                          ),
                          /*  Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: theme.accentColor,
                    child: Text('Login'),
                    onPressed: () {
                      //Check the username and password
                      checkLoginCredentials();
                    },
                  ),
                ),*/
                          //Create Account
                          /* Row(
                  children: <Widget>[
                    Text('Create Account?'),
                    FlatButton(
                      textColor: Color(0XFF414141),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )*/
                        ],
                      ),
                    ),
                  ),
                  new Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: CustomColours.appred,
                          alignment: Alignment.bottomCenter,
                          height: 45,
                          width: width,
                          child: IconButton(
                              icon: Image.asset("assets/images/Patriot_Mark_White.png",),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width: 50,),
                            Align(
                              alignment: Alignment.center,
                              child:  Text(
                                "Patriot Mobile",
                                //"Hello " + widget.subscriber.firstName,
                                style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 20,),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Container(width: 50,),
                            /*IconButton(
                                icon: Icon(Icons.dehaze_outlined,color:CustomColours.arealRagularGrey,),
                                onPressed: () {
                                  // Navigator.pop(context);
                                }),*/
                          ],
                        ),
                        /* AppBar(
                    centerTitle: true,
                    title:Container(
                      color: Colors.white,
                      width: width,
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
                      child:  Text(
                        "MY APP",
                        //"Hello " + widget.subscriber.firstName,
                        style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    iconTheme: IconThemeData(color: Colors.white),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),*/
                      ],
                    ),
                  ),
                ],
              )
          )
      );
    }  else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
          key: scaffoldKey,
          body:Container(
              //padding: EdgeInsets.only(left: width/5,right: width/5),
              child:Stack(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 80),
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new AssetImage("assets/images/Friends_beach.jpg",),
                              fit: BoxFit.cover
                          )
                      ),
                      child: ListView(
                        padding: EdgeInsets.all(10),
                        children: <Widget>[
                          SizedBox(height: 50,),
                          Container(
                            margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: emailController,
                              //decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'User Name'),
                              decoration: new InputDecoration(
                                filled: true,

                                fillColor: Colors.white,
                                hintText: 'User Name',
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextField(
                              obscureText: true,
                              controller: passwordController,
                              // decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
                              decoration: new InputDecoration(
                                filled: true,

                                fillColor: Colors.white,
                                hintText: 'Password',
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        /*  FlatButton(
                            onPressed: () {
                              //forgot password screen
                            },
                            textColor: Color(0XFF414141),
                            child: Text('Forgot Passwordff ?',style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                          ),
*/
                          SizedBox(height:10),
                          //Login
                          Container(
                            //width: width/1.5,
                            margin: EdgeInsets.only(top: 10,left: 40,right: 40),
                            child: Material(
                              elevation: 4.0,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(6.0),
                              color:CustomColours.samidarkRed,
                              child: MaterialButton(
                                 minWidth: width/5,
                                height: 40,
                                 padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                onPressed: () {
                                  //Check the username and password
                                  checkLoginCredentials();
                                },
                                child: Text('Login', textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Montserrat',)),
                              ),
                            ),
                          ),
                          /*  Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: theme.accentColor,
                    child: Text('Login'),
                    onPressed: () {
                      //Check the username and password
                      checkLoginCredentials();
                    },
                  ),
                ),*/

                          //Create Account
                          /* Row(
                  children: <Widget>[
                    Text('Create Account?'),
                    FlatButton(
                      textColor: Color(0XFF414141),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )*/
                        ],
                      ),
                    ),
                  ),
                  new Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          color: CustomColours.appred,
                          alignment: Alignment.center,
                          height: 45,
                          width: width,
                          child: IconButton(
                              icon: Image.asset("assets/images/Patriot_Mark_White.png",),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width: 50,),
                            Align(
                              alignment: Alignment.center,
                              child:  Text(
                                "Patriot Mobile",
                                //"Hello " + widget.subscriber.firstName,
                                style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 20,),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Container(width: 50,),
                          /*  IconButton(
                                icon: Icon(Icons.dehaze_outlined,color:CustomColours.arealRagularGrey,),

                                onPressed: () {
                                  // Navigator.pop(context);
                                }),*/

                          ],
                        ),
                        /* AppBar(
                    centerTitle: true,
                    title:Container(
                      color: Colors.white,
                      width: width,
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
                      child:  Text(
                        "MY APP",
                        //"Hello " + widget.subscriber.firstName,
                        style: theme.textTheme.headline4.copyWith(color: CustomColours.darkBlue,fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    iconTheme: IconThemeData(color: Colors.white),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),*/
                      ],
                    ),
                  ),
                ],
              )
          )
      );
    }
  }

  checkLoginCredentials() {
  /*  Subscriber subscriber;
    int id;
    bool isEmailMatching = false,
        isPassMatching = false;
    widget.subscribers.subscribers.forEach((element) {
      //  print('loginmail ${emailController.text.toString()}');
      print('loginmailee ${element.email}');
      if(emailController.text.toString()!=null&&emailController.text.toString()!='') {
        print('loginmail ${emailController.text.toString()}');
        if (element.email.toLowerCase() == emailController.text.toString().toLowerCase()) {
          //Email matches
          isEmailMatching = true;
          if (passwordController.text.toString() != null&&passwordController.text.toString() !='') {
            if (element.accountPin == passwordController.text.toString()) {
              //Password Matches
              isPassMatching = true;

              //Update the user id
              id = element.id;
              subscriber = element;
            }
          }
        }
      }
    });

    if (isEmailMatching && isPassMatching) {
      //Save user Data
      saveUserData(id);

      print('isEmail ${isEmailMatching} , '+'isPAss ${isPassMatching}');

      //Redirect to the home screen
     Navigator.push(context, MaterialPageRoute(builder: (context) => UserOnBoarding(subscriber)));
     // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(subscriber)));
    } else if (isEmailMatching && !isPassMatching) {
      //Incorrect password
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Incorrect password!'),
//          action: SnackBarAction(
//            label: 'Undo',
//            onPressed: () {
//              // Some code to undo the change.
//            },
//          ),
        ),
      );
    } else if (!isEmailMatching && !isPassMatching) {
      //This account does not exist

      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('This account does not exist!'),
//          action: SnackBarAction(
//            label: 'Undo',
//            onPressed: () {
//              // Some code to undo the change.
//            },
//          ),
        ),
      );
    }
 */
    if(emailController.text.toString()!=null&&emailController.text.toString()!='') {
      if(passwordController.text.toString()!=null&&passwordController.text.toString()!='') {
        callLoginApi(emailController.text.toString(),passwordController.text.toString());
      } else {
        //Incorrect password
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('Please enter email',
            textAlign: TextAlign.center,),
//          action: SnackBarAction(
//            label: 'Undo',
//            onPressed: () {
//              // Some code to undo the change.
//            },
//          ),
          ),
        );
      }
    } else {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Please enter email',
            textAlign: TextAlign.center,
    ),
//          action: SnackBarAction(
//            label: 'Undo',
//            onPressed: () {
//              // Some code to undo the change.
//            },
//          ),
        ),
      );
    }
  }
  Future<void> callLoginApi(String email,String pass) async {
    Subscriber subscriber;
    Subscribers subscribersModel= await getloginDetail(email, pass);
    print('loginsubscriberDetailId ${subscribersModel.subscribers.length}');
    // print('loginsubscriberDetailId ${loginDetailsEntity.subscribers.first.id}');

    if (subscribersModel.subscribers.length!=0) {
      subscribersModel.subscribers.forEach((element) {
        subscriber = element;
      });
      print('LOginsubscriber.id ${subscriber.id}');
      Navigator.push(context, MaterialPageRoute(builder: (context) => UserOnBoarding(subscriber)));
    } else{
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('This account does not exist!',
            textAlign: TextAlign.center,),
//          action: SnackBarAction(
//            label: 'Undo',
//            onPressed: () {
//              // Some code to undo the change.
//            },
//          ),
        ),
      );
    }
  }
  Future<Subscribers> getloginDetail(String email,String pass) async => await APIClient().getloginDetail(email, pass);
  saveUserData(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';
import 'package:mywebflutterapp/utils/myDialog.dart';

import 'important.dart';

class VerifyDetails extends StatefulWidget {
  final Subscriber subscriber;
  final Map mapPlanDetails;
  final lineItemIndex;

  VerifyDetails(this.subscriber, this.mapPlanDetails, this.lineItemIndex,
      {Key key})
      : super(key: key);

  @override
  VerifyDetailsState createState() => VerifyDetailsState();
}

class VerifyDetailsState extends State<VerifyDetails> {
  double width, height;
  var iccidController = TextEditingController();
  LinesDetailEntity linesDetail;
  String appbarTitle = 'Loyalty Upgrade';
  int failsCount = 0;

  @override
  void initState() {
    linesDetail = widget.mapPlanDetails["linesDetail"] ?? new List();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    print('veriDetailsLineId ${linesDetail.lines[widget.lineItemIndex].id}');

    if ((MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
          appBar: commonTopBar(
              width, height, appbarTitle, widget.subscriber, context),
          //Body
          body: Container(
            padding: EdgeInsets.only(left: width / 6, right: width / 6),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0),
                  color: Colors.white,
                  height: height / 1.2,
                  // margin: EdgeInsets.only(),
                  child: Center(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Free Loyalty Upgrade – Step 2',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CustomColours.appred,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 10),
                          alignment: Alignment.bottomCenter,
                          height: 3.0,
                          width: width,
                          color: CustomColours.lightGrey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Step 2 :',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  TextSpan(
                                      text:
                                          ' Enter your last four digits of ICCID number. (This is the identification number specific to your device). You can find this number in the email we sent and the SIM card we mailed you. Enter only the last four digits and click ',
                                      style: new TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                      )),
                                  TextSpan(
                                      text: 'submit',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Montserrat')),
                                ],
                              ),
                            ) /*Text('1. Enter your ICCID number. \n'
                              '2. You  can find this number in the  email we sent and the SIM card we mailed you.',
                            style: TextStyle(fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,fontFamily: 'Montserrat',),
                          ),*/
                            ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 3),
                          alignment: Alignment.bottomCenter,
                          height: 3.0,
                          width: width,
                          color: CustomColours.lightGrey,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            // margin: EdgeInsets.only(left: 10,right: 10),

                            child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            /*Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text('${linesDetail.lines[widget.lineItemIndex].manufacturer ?? "LINE"}',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: CustomColours.darkBlue),
                                                  ),
                                                ],),*/
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Phone Number ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: CustomColours
                                                          .darkBlue),
                                                ),
                                                Text(
                                                  '   ${linesDetail.lines[widget.lineItemIndex].mdn ?? ""}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: CustomColours
                                                          .grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Current Phone ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: CustomColours
                                                          .darkBlue),
                                                ),
                                                Text(
                                                  '   ${linesDetail.lines[widget.lineItemIndex].model ?? ""}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: CustomColours
                                                          .grayDark),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Current IMEI ',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: CustomColours
                                                          .darkBlue),
                                                ),
                                                Text(
                                                  '  ${linesDetail.lines[widget.lineItemIndex].imei ?? ""}',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: CustomColours
                                                          .grayDark),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        child: RichText(
                                          text: TextSpan(
                                            text: '',
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Enter ',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: 'Montserrat',
                                                      color: CustomColours
                                                          .grayDark)),
                                              TextSpan(
                                                  text:
                                                      'only the last four digits ',
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 18)),
                                              TextSpan(
                                                  text: 'and click submit.',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: 'Montserrat',
                                                      color: CustomColours
                                                          .grayDark)),
                                            ],
                                          ),
                                        )

                                        /*  Text('Enter only the last four digits and click submit.',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: CustomColours.grayDark),
                                          ),*/
                                        ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                //color: Colors.green,
                                alignment: Alignment.center,
                                child: iccidCode(),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: CustomColours.samidarkRed,
                                  child: MaterialButton(
                                    minWidth: width / 7,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    onPressed: () {
                                      checkIccidAndSubmit();
                                    },
                                    child: Text('Submit',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 18)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
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
                          alignment: Alignment.bottomCenter,
                          height: 4.0,
                          width: width,
                          color: CustomColours.lightGrey,
                        ),
                        SizedBox(
                          height: height / 45,
                        ),
                        Text(
                          'Copyright © 2021 patriotmobile - Patriot Mobile, Patriot Mobile Mobilizing Conservatives, Patriot Mobile Mobilizing Freedom are trademarks or registered trademarks of Patriot Mobile LLC.',
                          style: TextStyle(
                            color: CustomColours.arealRagularGrey,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ],
            ),
          ));
    } else if ((MediaQuery.of(context).size.width > 650 &&
        MediaQuery.of(context).size.width < 800)) {
      return Scaffold(
          appBar: commonTopBar(
              width, height, appbarTitle, widget.subscriber, context),
          //Body
          body: Container(
            padding: EdgeInsets.only(left: width / 12, right: width / 12),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0),
                  color: Colors.white,
                  height: height / 1.2,
                  // margin: EdgeInsets.only(),
                  child: Center(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Free Loyalty Upgrade – Step 2',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CustomColours.appred,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 10),
                          alignment: Alignment.bottomCenter,
                          height: 3.0,
                          width: width,
                          color: CustomColours.lightGrey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '1. Enter your ICCID number. \n'
                            '2. You  can find this number in the  email we sent and the SIM card we mailed you.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 3),
                          alignment: Alignment.bottomCenter,
                          height: 3.0,
                          width: width,
                          color: CustomColours.lightGrey,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                /* Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text('${linesDetail.lines[widget.lineItemIndex].manufacturer ?? "LINE"}',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                          color: CustomColours.darkBlue),
                                                    ),
                                                  ],),*/
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Phone Number ',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .darkBlue),
                                                    ),
                                                    Text(
                                                      '   ${linesDetail.lines[widget.lineItemIndex].mdn ?? ""}',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .grayDark),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Current Phone ',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .darkBlue),
                                                    ),
                                                    Text(
                                                      '   ${linesDetail.lines[widget.lineItemIndex].model ?? ""}',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .grayDark),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Current IMEI ',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .darkBlue),
                                                    ),
                                                    Text(
                                                      '  ${linesDetail.lines[widget.lineItemIndex].imei ?? ""}',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .grayDark),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Enter only the last four digits and click submit.',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.normal,
                                                color: CustomColours.grayDark),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //color: Colors.green,
                                    alignment: Alignment.center,
                                    child: iccidCode(),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Material(
                                      elevation: 4.0,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColours.samidarkRed,
                                      child: MaterialButton(
                                        minWidth: width / 7,
                                        padding: EdgeInsets.fromLTRB(
                                            20.0, 15.0, 20.0, 15.0),
                                        onPressed: () {
                                          checkIccidAndSubmit();
                                        },
                                        child: Text('Submit',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 18)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),

                        /*   Align(
                 alignment: Alignment.bottomCenter,
                 child:Image.asset("assets/images/american_flag_isolated.png",),
                 */ /* child: AspectRatio(
             aspectRatio: (width)/(height/4),
               child:Image.asset("assets/images/american_flag_isolated.png",),
               // child:image: Image.asset("assets/images/onboarding_1.png"),

           ),*/ /*
               )*/
                      ],
                    ),
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
                          alignment: Alignment.bottomCenter,
                          height: 4.0,
                          width: width,
                          color: CustomColours.lightGrey,
                        ),
                        SizedBox(
                          height: height / 45,
                        ),
                        Text(
                          'Copyright © 2021 patriotmobile - Patriot Mobile, Patriot Mobile Mobilizing Conservatives, Patriot Mobile Mobilizing Freedom are trademarks or registered trademarks of Patriot Mobile LLC.',
                          style: TextStyle(
                              color: CustomColours.arealRagularGrey,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat',
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ],
            ),
          ));
    } else if ((MediaQuery.of(context).size.width < 650)) {
      return Scaffold(
          appBar: commonTopBar(
              width, height, appbarTitle, widget.subscriber, context),
          //Body
          body: Container(
            // padding: EdgeInsets.only(left: width/5,right: width/5),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0),
                  color: Colors.white,
                  height: height / 1.2,
                  // margin: EdgeInsets.only(),
                  child: Center(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Free Loyalty Upgrade – Step 2',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CustomColours.appred,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 10),
                          alignment: Alignment.bottomCenter,
                          height: 3.0,
                          width: width,
                          color: CustomColours.lightGrey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '1. Enter your ICCID number. \n'
                            '2. You  can find this number in the  email we sent and the SIM card we mailed you.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 3),
                          alignment: Alignment.bottomCenter,
                          height: 3.0,
                          width: width,
                          color: CustomColours.lightGrey,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                /*Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text('${linesDetail.lines[widget.lineItemIndex].manufacturer ?? "LINE"}',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                          color: CustomColours.darkBlue),
                                                    ),
                                                  ],),*/
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Phone Number ',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .darkBlue),
                                                    ),
                                                    Text(
                                                      '   ${linesDetail.lines[widget.lineItemIndex].mdn ?? ""}',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 16, fontFamily: 'Montserrat',

                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .grayDark),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Current Phone ',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .darkBlue),
                                                    ),
                                                    Text(
                                                      '   ${linesDetail.lines[widget.lineItemIndex].model ?? ""}',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .grayDark),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Current IMEI ',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .darkBlue),
                                                    ),
                                                    Text(
                                                      '  ${linesDetail.lines[widget.lineItemIndex].imei ?? ""}',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: CustomColours
                                                              .grayDark),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Enter only the last four digits and click submit.',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.normal,
                                                color: CustomColours.grayDark),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //color: Colors.green,
                                    alignment: Alignment.center,
                                    child: iccidCode(),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Material(
                                      elevation: 4.0,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomColours.samidarkRed,
                                      child: MaterialButton(
                                        minWidth: width / 7,
                                        padding: EdgeInsets.fromLTRB(
                                            20.0, 15.0, 20.0, 15.0),
                                        onPressed: () {
                                          checkIccidAndSubmit();
                                        },
                                        child: Text('Submit',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),

                        /*   Align(
                 alignment: Alignment.bottomCenter,
                 child:Image.asset("assets/images/american_flag_isolated.png",),
                 */ /* child: AspectRatio(
             aspectRatio: (width)/(height/4),
               child:Image.asset("assets/images/american_flag_isolated.png",),
               // child:image: Image.asset("assets/images/onboarding_1.png"),

           ),*/ /*
               )*/
                      ],
                    ),
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
                          alignment: Alignment.bottomCenter,
                          height: 4.0,
                          width: width,
                          color: CustomColours.lightGrey,
                        ),
                        SizedBox(
                          height: height / 45,
                        ),
                        Text(
                          'Copyright © 2021 patriotmobile - Patriot Mobile, Patriot Mobile Mobilizing Conservatives, Patriot Mobile Mobilizing Freedom are trademarks or registered trademarks of Patriot Mobile LLC.',
                          style: TextStyle(
                              color: CustomColours.arealRagularGrey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ],
            ),
          ));
    }
  }

  iccidCode() {
    return Container(
        width: width / 4,
        decoration: myBoxDecoration(),
        margin: const EdgeInsets.only(left: 0, right: 0.0, top: 0),
        child: TextField(
          obscureText: false,
          controller: iccidController,
          cursorColor: CustomColours.darkred,
          style: TextStyle(color: CustomColours.darkred),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 10.0, top: 0, right: 5, bottom: 0),
            hintText: 'ICCID',
          ),
        ));

    /*Container(
          decoration: myBoxDecoration(),
          margin: const EdgeInsets.only(left: 0, right: 0.0, top: 0),
          child: TextField(
            obscureText: false,
            controller: enterCouponController,
            cursorColor: CustomColours.darkred,
            style: TextStyle(color: CustomColours.darkred),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: 10.0, top: 0, right: 5, bottom: 0),
              hintText: "apply coupon",
            ),
          )
      );*/
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        border: Border.all(width: 1, color: CustomColours.grayDark));
  }

  void checkIccidAndSubmit() {
    String iccid =
        ' ${linesDetail.lines[widget.lineItemIndex].attributeValues.x82}';
    print('fullICCID ${iccid}');
    //var lastFourIccid = iccid.substring(-4);
    var lastFourIccid = iccid.substring(iccid.length - 4);
    print('last4 ${lastFourIccid}');
    print('Enteredlast4 ${iccidController.text.toString()}');
    // if (lastFourIccid==iccidController.text.toString()) {
    // if (lastFourIccid==iccidController.text.toString()) {
    if (iccidController.text.toString() == null ||
        iccidController.text.toString() == '') {
      MyDialog(
              context: context,
              title: "Please Enter only the last four digits and click submit.",
              typeDialog: 0)
          .show();
      return;
    }

    if (linesDetail.lines[widget.lineItemIndex].attributeValues.x82 != null &&
        linesDetail.lines[widget.lineItemIndex].attributeValues.x82
            .contains(iccidController.text.toString())) {
      print('bothlast4IS same');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Important(widget.subscriber,
                  widget.mapPlanDetails, widget.lineItemIndex)));
    } else {
      /* Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) =>
              Important(widget.subscriber, widget.mapPlanDetails,
                  widget.lineItemIndex)));*/

      failsCount = failsCount + 1;
      if (failsCount > 3) {
        MyDialog(
                context: context,
                title: " Please enter the entire ICCID",
                typeDialog: 0)
            .show();
        iccidController.clear();
      } else {
        MyDialog(
                context: context,
                title:
                    "The last 4 you entered does not match with ICCID in System. Please try again",
                typeDialog: 0)
            .show();
        iccidController.clear();
      }
    }
  }

  //get single LineId data calling by line id
  Future<LinesDetailEntity> getSingleLineData(String lineID) async =>
      await APIClient().getSingleLineData(lineID);
}

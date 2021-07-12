import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/get_products_model_entity.dart';
import 'package:mywebflutterapp/models/line_recurring_plans_entity.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/screens/migrates/emailverifications.dart';
import 'package:mywebflutterapp/screens/migrates/help_once_sim_card_port_comlete.dart';
import 'package:mywebflutterapp/screens/migrates/transition_migration.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';
import 'package:http/http.dart' as http;
class Important extends StatefulWidget {
  final Subscriber subscriber;
  final Map mapPlanDetails;
  final lineItemIndex;
  Important(this.subscriber, this.mapPlanDetails, this.lineItemIndex,  {Key key}) : super(key: key);
  @override
  ImportantState createState() => ImportantState();
}

class ImportantState extends State<Important> {
  double width, height;
  LinesDetailEntity linesDetail;
  String appbarTitle = 'Loyalty Upgrade';
  LineRecurringPlansEntity lineRecurringPlan;
  bool isLoading = false;
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
    print('lineIDInVerifyDetails ${linesDetail.lines[widget.lineItemIndex].id.toString()}');
    getLineRecurringPlan();
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
                  //height: height/4,
                  child: ListView(
                    children: [
                      SizedBox(height: 0,),
                      Container(
                        alignment: Alignment.center,
                        child:Text('Free Loyalty Upgrade - Step 3',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: CustomColours.appred,fontFamily: 'Montserrat',),
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

                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        child:RichText(
                          text: TextSpan(
                            text: '',
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Step 3 :',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat'),
                              ),
                              TextSpan(
                                  text:
                                  ' Verify your ICCID number. Click ${'YES'} to start your upgrade.',  style: new TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                  )),

                            ],
                          ),
                        )


                        // Text('',
                        //   style: TextStyle(fontSize: 16,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.black,fontFamily: 'Montserrat',),
                        //
                        // ),
                      ),
                      SizedBox(height: 10,),
                   Container(
                    margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                    alignment:Alignment.bottomCenter,
                    height:3.0,
                    width:width,
                    color:CustomColours.lightGrey,
                  ),

                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                    text: TextSpan(
                                      text: 'Do ',
                                      style: TextStyle(fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: CustomColours.darkBlue),
                                      children: <TextSpan>[
                                        TextSpan(text: 'NOT', style: TextStyle(fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColours.samidarkRed,fontFamily: 'Montserrat',)),
                                        //TextSpan(text: ' insert your new SIM \n card before your line moves to ${linesDetail.lines[widget.lineItemIndex].attributeValues.x78.toString()}. \n This will insure you do not lose service.',
                                        TextSpan(text: ' insert your new SIM \n card before your line moves recommended carrier. \n This will insure you do not lose service.',
                                          style: TextStyle(fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: CustomColours.darkBlue),),
                                      ],
                                    ),
                                    textAlign:TextAlign.center
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Please verify  the ICCID.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('${linesDetail.lines[widget.lineItemIndex].attributeValues.x82}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkred),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Ready to receive your Free Loyalty Upgrade?',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isLoading?CircularProgressIndicator(): Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:CustomColours.samidarkRed,
                                  child: MaterialButton(
                                    minWidth: width/12,
                                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                    onPressed: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      callChangeCarrierApi();
                                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HelpOnceSimCardPortComlete(widget.subscriber)));
                                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                    },
                                    child: Text('Yes', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16)),

                                  ),
                                ),
                                SizedBox(width: 25,),
                                 Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:CustomColours.samidarkRed,
                                  child: MaterialButton(
                                    minWidth: width/12,
                                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                    onPressed: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransitionMigration(subscriber:widget.subscriber)));
                                    },
                                    child: Text('No', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16)),

                                  ),
                                ),
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
                  //height: height/4,
                  child: ListView(
                    children: [
                      SizedBox(height: 0,),
                      Container(
                        alignment: Alignment.center,
                        child:Text('Free Loyalty Upgrade - Step 3',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: CustomColours.appred,fontFamily: 'Montserrat',),
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

                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        child:Text('Verify your ICCID number. Click ${'YES'} to start your upgrade.',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,fontFamily: 'Montserrat',),

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

                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: RichText(
                                      text: TextSpan(
                                        text: 'Do ',
                                        style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: CustomColours.darkBlue),
                                        children: <TextSpan>[
                                          TextSpan(text: 'NOT', style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',)),
                                          TextSpan(text: ' insert your new SIM \n card before your line moves recommended carrier. \n This will insure you do not lose service.',
                                            style: TextStyle(fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: CustomColours.darkBlue),),
                                        ],
                                      ),
                                      textAlign:TextAlign.center
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Please verify  the ICCID.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('${linesDetail.lines[widget.lineItemIndex].iccid}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkred),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Ready to receive your Free Loyalty Upgrade?',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isLoading?CircularProgressIndicator(): Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:CustomColours.samidarkRed,
                                  child: MaterialButton(
                                    minWidth: width/12,
                                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                    onPressed: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      callChangeCarrierApi();
                                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                    },
                                    child: Text('Yes', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16)),

                                  ),
                                ),
                                SizedBox(width: 25,),
                                Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:CustomColours.samidarkRed,
                                  child: MaterialButton(
                                    minWidth: width/12,
                                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                    onPressed: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      //callChangeCarrierApi();
                                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransitionMigration(subscriber:widget.subscriber)));
                                    },
                                    child: Text('No', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16)),

                                  ),
                                ),
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
    }  else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          //Body
          body:Container(
           // padding: EdgeInsets.only(left: width/5,right: width/5),
            child: Stack(
              children: [

                Container(
                  margin: EdgeInsets.only(top: 30),
                  //height: height/4,
                  child: ListView(
                    children: [
                      SizedBox(height: 0,),
                      Container(
                        alignment: Alignment.center,
                        child:Text('Free Loyalty Upgrade - Step 3',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: CustomColours.appred,fontFamily: 'Montserrat',),
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

                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        child:Text('Verify your ICCID number. Click ${'YES'} to start your upgrade.',
                          style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,fontFamily: 'Montserrat',),

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

                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: RichText(
                                      text: TextSpan(
                                        text: 'Do ',
                                        style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: CustomColours.darkBlue),
                                        children: <TextSpan>[
                                          TextSpan(text: 'NOT', style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColours.samidarkRed,fontFamily: 'Montserrat',)),
                                          TextSpan(text: ' insert your new SIM \n card before your line moves recommended carrier. \n This will insure you do not lose service.',
                                            style: TextStyle(fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: CustomColours.darkBlue),),
                                        ],
                                      ),
                                      textAlign:TextAlign.center
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Please verify  the ICCID.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('${linesDetail.lines[widget.lineItemIndex].iccid}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.darkred),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment.center,
                              child:Text('Ready to receive your Free Loyalty Upgrade?',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CustomColours.grayDark),
                              ),
                            ),
                            SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isLoading?CircularProgressIndicator(): Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:CustomColours.samidarkRed,
                                  child: MaterialButton(
                                    minWidth: width/12,
                                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                    onPressed: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      callChangeCarrierApi();
                                     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                    },
                                    child: Text('Yes', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16)),

                                  ),
                                ),
                                SizedBox(width: 25,),
                                Material(
                                  elevation: 4.0,
                                  shadowColor: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:CustomColours.samidarkRed,
                                  child: MaterialButton(
                                    minWidth: width/12,
                                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                    onPressed: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      //callChangeCarrierApi();
                                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransitionMigration(subscriber:widget.subscriber)));
                                    },
                                    child: Text('No', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16)),

                                  ),
                                ),
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
    }

  }
  ///Get all the values fetched from the API
  Future<Map> getLineRecurringPlan() async {
    //Load the lineRecurringPlan
    lineRecurringPlan = await getLineRecurringPlans(linesDetail.lines[widget.lineItemIndex].id.toString(),widget.subscriber.id.toString());
    print('lineRecurringData ${lineRecurringPlan.lineRecurringPlans[0].currentProductId}');
    GetProductsModelEntity currentProducts = await getCurrentProductBy(lineRecurringPlan.lineRecurringPlans[0].currentProductId.toString());


    //Return the data
    return {
      "lineRecurringPlan": lineRecurringPlan,
      "currentProducts": currentProducts,
    };
  }
  //Get Find the current plan id from LineRecurringPlans api
  Future<LineRecurringPlansEntity> getLineRecurringPlans(String lineID, String subsId) async => await APIClient().getLineRecurringPlans(lineID,subsId);
  //get products by new productID
  Future<GetProductsModelEntity> getCurrentProductBy(String procuctID) async => await APIClient().getCurrentProductBy(procuctID);

  Future<String> callChangeCarrierApi() async {
    String  new_carrier_id;
    String  device_serial;
    String  iccid;
    String  old_product_id;
    String  new_product_id;
    String  lineID;

    lineID = linesDetail.lines[widget.lineItemIndex].id.toString();
    new_carrier_id = linesDetail.lines[widget.lineItemIndex].attributeValues.x78.toString();
    if(new_carrier_id=='T-Mobile (Plintron)'){
      new_carrier_id = '5';
    }else {
      new_carrier_id = '4';
    }
    device_serial = linesDetail.lines[widget.lineItemIndex].imei.toString();
    print('deviceSerialf1 $device_serial');
    if (device_serial=='null'||device_serial=='') {
      device_serial = linesDetail.lines[widget.lineItemIndex].meidHex.toString();
      print('deviceSerialif $device_serial');
    } /*else{
      device_serial = linesDetail.lines[widget.lineItemIndex].imei.toString();
      print('deviceSerialelse $device_serial');
    }*/
    iccid = linesDetail.lines[widget.lineItemIndex].attributeValues.x82.toString();
    old_product_id  = lineRecurringPlan.lineRecurringPlans[0].currentProductId.toString();
    new_product_id = linesDetail.lines[widget.lineItemIndex].attributeValues.x79.toString();
    new_product_id =  new_product_id.substring(0, 3);
    print('new_product_id ${new_product_id}');
    var bodyvalue =   {
      "new_carrier_id": "${new_carrier_id}",
      "device_serial": "${device_serial}",
      "iccid": "${iccid}",
      "product_mapping": [
        {"old_product_id": "${old_product_id}",
          "new_product_id": "${new_product_id}"
        }
      ]
    };
    /*var dummybodyvalue =  {
"new_carrier_id": "4",
"device_serial": "015767000012473",
"iccid": "89014103282335271645",
"product_mapping": [
{"old_product_id": "647",
"new_product_id": "640"
}
]
}*/

    print('charrierdata1 ${bodyvalue}  LIneID ${lineID}');
    http.Response response =  await ChangeCarrierPostApi(bodyvalue,lineID);

    /* if (response.statusCode == 200) {
      //successfully loaded
      // var successResponse =  jsonDecode(response.body);
      var successResponse =  "${response.statusCode}";
      return response;
    } else {
      print('response.statusCode:- ${response.statusCode}');
      return response;
    }*/

    print('charrierdata1 ${bodyvalue}  LIneID ${lineID}');
    if (response.statusCode==200) {
      isLoading = false;
      callCompletTransitionapi(new_carrier_id,new_product_id,iccid,lineID);
    }  else{
      if (new_carrier_id=='4') {
        new_product_id=='640';
      } else{
        new_product_id=='675';
      }
      var  bodyvalue =   {
        "new_carrier_id": "${new_carrier_id}",
        "device_serial": "${device_serial}",
        "iccid": "${iccid}",
        "product_mapping": [
          {"old_product_id": "${old_product_id}",
            "new_product_id": "${new_product_id}"
          }
        ]
      };
      print('charrierdata2 ${bodyvalue} LIneID ${lineID}');
      http.Response response =  await ChangeCarrierPostApi(bodyvalue,lineID);
      isLoading = false;
      if(response.statusCode==200){
        callCompletTransitionapi(new_carrier_id,new_product_id,iccid,lineID);
      }else{
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HelpOnceSimCardPortComlete(widget.subscriber)));
      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));

        //  MyDialog(context: context,title: "Please Call 972-728-7468",typeDialog: 0).show();
        //display error dialog
        setState(() {
          isLoading = false;
        });
         Map successResponse =  jsonDecode(response.body);
       /* var  errorMsg;
      try {
       // if(successResponse["errors"][0].containsKey('message')){
        if(successResponse["errors"].hashCode('')){
          errorMsg = successResponse["errors"][0]["message"];
          print("errorbaseif $errorMsg");
        }else{
          errorMsg = successResponse["errors"]["base"][0];
          print("errorbaseelse $errorMsg");
        }
       // print("errorbase $errorMsg");
      } on Exception catch (_) {
        print('never reached');
      }*/
        displayDialog(context,successResponse);
      }
    }
  }
//callChangeCarrierApi
  Future<http.Response> ChangeCarrierPostApi ( var postChangeCarrier,String lineID) async => await APIClient().ChangeCarrierPostApi( postChangeCarrier ,lineID);
  Future<String> callCompletTransitionapi(String new_carrier_id,String new_product_id,String iccid,String lineID) async{
    var updateTransition = {
      "line":
      {
        "attribute_values":{
          "77":"Completed Transition",
          "78":"${new_carrier_id}",
          "79":"${new_product_id}",
          "82":"${iccid}"
        }
      }
    };
    String updateTransitionResponse = await updateCompletTransition(updateTransition,lineID);
    print('CompleteTransitionResponse ${updateTransitionResponse}');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HelpOnceSimCardPortComlete(widget.subscriber)));
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, widget.mapPlanDetails,widget.lineItemIndex)));
  }
  Future<String> updateCompletTransition (var updateTransition ,String lineID) async => await APIClient().updateCompletTransitionPutApi(updateTransition,lineID);

  displayDialog(BuildContext context, errorMsg) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            title: Text("Looks like something went wrong. Please Call 972-PATRIOT"),
            content: Text('Error: ${errorMsg??'Error'} '),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isLoading = false;
                  });
                },
                child: Text("ok"),
              ),
            ],
          );
        }
    );
  }
}
import 'dart:core';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/models/subscriber_detail.dart';
import 'package:mywebflutterapp/models/subscriber_statement.dart';
import 'package:mywebflutterapp/screens/migrates/verifyDetails.dart';

import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';


import 'emailverifications.dart';
import 'help_once_sim_card_port_comlete.dart';
class TransitionMigration extends StatefulWidget {

  final Subscriber subscriber;
  TransitionMigration({this.subscriber,Key key}) : super(key: key);


  @override
  TransitionMigrationState createState() =>
      TransitionMigrationState();
}

class TransitionMigrationState
    extends State<TransitionMigration> {
  double width, height;
  var iccidController = TextEditingController();
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
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0,bottom: height/15),
                  color: Colors.transparent,
                  child: Center(
                    child: ListView(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child:Text('Free Loyalty Upgrade – Step 1',
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
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('If your phone appears below, you qualify for a free\n'
                                  'loyalty upgrade.Complete this simple 3 steps process and be\nautomatically entered to win a 1st class trip for two. \n '
                                ,
                                style: TextStyle(fontSize: 14,
                                  color: Colors.black,fontFamily: 'Montserrat',),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Step 1 :-',
                                    style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,fontFamily: 'Montserrat',),
                                    textAlign: TextAlign.left,
                                  ), Text(' Verify Your Phone Number, Click Free Upgrade. If you\n see multiple phone numbers, you MUST complete the three\n steps for each number.',
                                    style: TextStyle(fontSize: 14,
                                      color: Colors.black,fontFamily: 'Montserrat',),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
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
                        FutureBuilder<Map>(
                          future: getAllDetails(),
                          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                            if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));

                            LinesDetailEntity linesDetail = snapshot.data["linesDetail"];
                            SubscriberDetail subscriberDetail = snapshot.data["subscriberDetail"];
                            BillingStatements billingStatements = snapshot.data["billingStatement"];

                            return  Container(
                                height: height/1.9,
                                margin: EdgeInsets.only(left: width/12,right: width/12),
                                child:  ListView.builder(
                                  itemCount: linesDetail.lines.length,
                                  // itemCount: 6,
                                  itemBuilder: (BuildContext context, int lineItemIndex) {
                                    //Load the details for all the lines
                                    print('lineslength ${linesDetail.lines.length}');
                                    print('linesleng77 ${linesDetail.lines[lineItemIndex].attributeValues.x77}');
                                    //Load the details for all the lines
                                    return Center(
                                      child: displayMigratButton(linesDetail,lineItemIndex,snapshot.data),
                                    );
                                  },
                                )
                            );
                          },
                        ),
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
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0,bottom: height/15),
                  color: Colors.transparent,
                  child: Center(
                    child: ListView(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child:Text('Free Loyalty Upgrade – Step 1',
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
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('If your phone appears below, you qualify for a free\n'
                                  'loyalty upgrade.Complete this simple 3 steps process and be\nautomatically entered to win a 1st class trip for two. \n '
                                ,
                                style: TextStyle(fontSize: 14,
                                  color: Colors.black,fontFamily: 'Montserrat',),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Step 1 :-',
                                    style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,fontFamily: 'Montserrat',),
                                    textAlign: TextAlign.left,
                                  ), Text(' Verify Your Phone Number, Click Free Upgrade. If you\n see multiple phone numbers, you MUST complete the three\n steps for each number.',
                                    style: TextStyle(fontSize: 14,
                                      color: Colors.black,fontFamily: 'Montserrat',),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
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
                        FutureBuilder<Map>(
                          future: getAllDetails(),
                          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                            if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));

                            LinesDetailEntity linesDetail = snapshot.data["linesDetail"];
                            SubscriberDetail subscriberDetail = snapshot.data["subscriberDetail"];
                            BillingStatements billingStatements = snapshot.data["billingStatement"];
                            return  Container(
                                height: height/1.9,
                                margin: EdgeInsets.only(left: width/12,right: width/12),
                                child:  ListView.builder(
                                  itemCount: linesDetail.lines.length,
                                  // itemCount: 6,
                                  itemBuilder: (BuildContext context, int lineItemIndex) {
                                    print('lineslength ${linesDetail.lines.length}');
                                    print('linesleng77 ${linesDetail.lines[lineItemIndex].attributeValues.x77}');
                                    //Load the details for all the lines
                                    return Center(
                                      child: displayMigratButton(linesDetail,lineItemIndex,snapshot.data),
                                    );
                                  },
                                )
                            );
                          },
                        ),


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
            //padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0,bottom: height/15),
                  color: Colors.transparent,
                  child: Center(
                    child: ListView(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child:Text('Free Loyalty Upgrade – Step 1',
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
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('If your phone appears below, you qualify for a free\n'
                                  'loyalty upgrade.Complete this simple 3 steps process and be\nautomatically entered to win a 1st class trip for two. \n '
                                ,
                                style: TextStyle(fontSize: 14,
                                  color: Colors.black,fontFamily: 'Montserrat',),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Step 1 :-',
                                    style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,fontFamily: 'Montserrat',),
                                    textAlign: TextAlign.left,
                                  ), Text(' Verify Your Phone Number, Click Free Upgrade. If you\n see multiple phone numbers, you MUST complete the three\n steps for each number.',
                                    style: TextStyle(fontSize: 14,
                                      color: Colors.black,fontFamily: 'Montserrat',),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
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
                        FutureBuilder<Map>(
                          future: getAllDetails(),
                          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                            if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));

                            LinesDetailEntity linesDetail = snapshot.data["linesDetail"];
                            SubscriberDetail subscriberDetail = snapshot.data["subscriberDetail"];
                            BillingStatements billingStatements = snapshot.data["billingStatement"];
                            return  Container(
                                height: height/1.9,
                                margin: EdgeInsets.only(left: width/12,right: width/12),
                                child:  ListView.builder(
                                  itemCount: linesDetail.lines.length,
                                  // itemCount: 6,
                                  itemBuilder: (BuildContext context, int lineItemIndex) {
                                    //Load the details for all the lines
                                    print('lineslength ${linesDetail.lines.length}');
                                    print('linesleng77 ${linesDetail.lines[lineItemIndex].attributeValues.x77}');
                                    //Load the details for all the lines
                                    return Center(
                                      child: displayMigratButton(linesDetail,lineItemIndex,snapshot.data),
                                    );
                                  },
                                )
                            );
                          },
                        ),


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
  iccidCode() {
    return
      Container(
          width: width/1.5,
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
              contentPadding: EdgeInsets.only(
                  left: 10.0, top: 0, right: 5, bottom: 0),
              hintText: 'ICCID',
            ),
          )
      );




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
        borderRadius: BorderRadius.all(  Radius.circular(6)),
        border: Border.all(width: 1,color: CustomColours.grayDark)
    );
  }

  ///Get all the values fetched from the API
  Future<Map> getAllDetails() async {
    print('subscriberIDforMigration :-  ${widget.subscriber.id.toString()}');
    //Load the line and the subscriber detail
    LinesDetailEntity linesDetail = await getLinesData();

    print('migrationLinedata :-  ${linesDetail.lines[0].id}');
    print('migrationLinedataLength :-  ${linesDetail.lines.length}');
    SubscriberDetail subscriberDetail = await getSubscriberData();

    //Load the billing details from the "current_billing_statement_id" field from the subscriber API
    BillingStatements billingStatements = await getBillingStatement(subscriberDetail.currentBillingStatementId.toString());

    //Return the data
    return {
      "linesDetail": linesDetail,
      "subscriberDetail": subscriberDetail,
      "billingStatement": billingStatements,
    };
  }

  Future<LinesDetailEntity> getLinesData() async => await APIClient().getLinesDetail(widget.subscriber.id.toString());

  Future<SubscriberDetail> getSubscriberData() async => await APIClient().getSingleSubDetail(widget.subscriber.id.toString());

  Future<BillingStatements> getBillingStatement(String billingStatementId) async =>
      await APIClient().getBillingStatement(billingStatementId);

  Widget displayMigratButton(LinesDetailEntity linesDetail, int lineItemIndex, Map data) {
    String buttonLable,btnLableName;
    if (linesDetail.lines[lineItemIndex].status == "active") {
      if(linesDetail.lines[lineItemIndex].attributeValues.x77!=null&&linesDetail.lines[lineItemIndex].attributeValues.x77=='Needs Transition'||
          linesDetail.lines[lineItemIndex].attributeValues.x77=='Completed Transition') {

        buttonLable =linesDetail.lines[lineItemIndex].attributeValues.x77;


        if (buttonLable=='Needs Transition') {
          btnLableName = 'Free  Upgrade';
        }  else if(buttonLable=='Completed Transition'){
          btnLableName = 'Device Activation Instructions';
        }
        return Padding(
            padding: EdgeInsets.only(
                bottom: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              // padding: EdgeInsets.only(bottom: 5),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/diviceimg.png",),

                  Expanded(
                    child: Text(
                      // '${linesDetail.lines[lineItemIndex].mdn ??
                      '${convertMdn(linesDetail.lines[lineItemIndex].mdn) ??
                          "LINE"}',
                      textAlign: TextAlign
                          .center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight
                              .bold,
                          color: CustomColours
                              .darkBlue),
                    ),
                  ),
                  SizedBox(width: 70,),
                  Container(
                    width: 120,
                    //height: 40,
                    child: Material(
                      elevation: 4.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius
                          .circular(10.0),
                      color: CustomColours
                          .samidarkRed,
                      child: MaterialButton(
                        // minWidth: width,
                        padding: EdgeInsets
                            .fromLTRB(
                            20.0, 10.0, 20.0,
                            10.0),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyDetails(widget.subscriber, data, lineItemIndex)));


                          if (buttonLable=='Needs Transition') {

                            //  String videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=BBAyRBTfsOU");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => VerifyDetails(widget.subscriber, data, lineItemIndex)));
                            //   MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, data,lineItemIndex)));


                            //  MaterialPageRoute(builder: (context) => VideoScreen(id: "videoId")));
                          }  else if(buttonLable=='Completed Transition'){
                            //  Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerification(widget.subscriber, data,lineItemIndex)));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HelpOnceSimCardPortComlete(widget.subscriber)));
                          }
                        },
                        child: Text('${btnLableName}',
                            textAlign: TextAlign
                                .center,
                            style: TextStyle(
                                color: Colors
                                    .white,
                                fontSize: 16)),
                      ),
                    ),
                  )
                ],
              ),

            ));
      }
    } else {
      return Container();
    }
  }

  convertMdn(String mdn) {
    String mdn1 = "";
    mdn1 = StringUtils.addCharAtPosition(mdn, ".", 3);
    mdn1 = StringUtils.addCharAtPosition(mdn1, ".", 7);
    return mdn1;
  }


}
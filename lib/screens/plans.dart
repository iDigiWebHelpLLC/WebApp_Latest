import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/models/subscriber_detail.dart';
import 'package:mywebflutterapp/models/subscriber_statement.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';

import 'lines.dart';


class PlansScreen extends StatefulWidget {
  final Subscriber subscriber;

  PlansScreen(this.subscriber);

  @override
  _PlansScreenState createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  double width, height;
   String appbarTitle = 'Account Overview';
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
                  margin: EdgeInsets.only(top: 50,bottom: 40),
                  child:  Column(
                    children: [
                      Expanded(
                        child: FutureBuilder<Map>(
                          future: getAllDetails(),
                          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                            if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));
                            //Return all the cards populated
                            return Stack(
                              children: [
                                Container(
                                  //   margin: EdgeInsets.only(bottom: height/3),
                                  child:  ListView(
                                    //padding: EdgeInsets.all(18),
                                    children: [
                                      //toolbar(theme),
                                      //Get the lines data
                                      getLinesList(theme, snapshot.data),
                                      //Get the detailed information on all the lines
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FlatButton(
                                            color: CustomColours.samidarkRed,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                            child: Text("View My Lines", style: theme.textTheme.bodyText1.copyWith(color: Colors.white)),
                                            onPressed: () =>
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => LinesScreen(widget.subscriber, snapshot.data))),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: height/10,),
                                      // Image.asset("assets/images/Two-senior-woman_1043661770.jpg",),

                                      /*   Positioned(
                                    bottom: 50,
                                    left: 0.0,
                                    right: 0.0,
                                    child:Image.asset("assets/images/Two-senior-woman_1043661770.jpg",),

                                  ),*/
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
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
                          '@2021 Patriot mobile',
                          style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                          textAlign: TextAlign.center,

                        ),

                      ],
                    )
                ),
                SizedBox(height: 20,),
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
                  margin: EdgeInsets.only(top: 50,bottom: 40),
                  child:  Column(
                    children: [
                      Expanded(
                        child: FutureBuilder<Map>(
                          future: getAllDetails(),
                          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                            if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));
                            //Return all the cards populated
                            return Stack(
                              children: [
                                Container(
                                  //   margin: EdgeInsets.only(bottom: height/3),
                                  child:  ListView(
                                    //padding: EdgeInsets.all(18),
                                    children: [
                                      //toolbar(theme),
                                      //Get the lines data
                                      getLinesList(theme, snapshot.data),
                                      //Get the detailed information on all the lines
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FlatButton(
                                            color: CustomColours.samidarkRed,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                            child: Text("View My Lines", style: theme.textTheme.bodyText1.copyWith(color: Colors.white)),
                                            onPressed: () =>
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => LinesScreen(widget.subscriber, snapshot.data))),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: height/10,),
                                      // Image.asset("assets/images/Two-senior-woman_1043661770.jpg",),

                                      /*   Positioned(
                                    bottom: 50,
                                    left: 0.0,
                                    right: 0.0,
                                    child:Image.asset("assets/images/Two-senior-woman_1043661770.jpg",),

                                  ),*/
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
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
                          '@2021 Patriot mobile',
                          style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                          textAlign: TextAlign.center,

                        ),

                      ],
                    )
                ),
                SizedBox(height: 20,),
              ],
            ),
          )
      );
    }  else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          //Body
          body:Container(
          //  padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50,bottom: 40),
                  child:  Column(
                    children: [
                      Expanded(
                        child: FutureBuilder<Map>(
                          future: getAllDetails(),
                          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                            if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));
                            //Return all the cards populated
                            return Stack(
                              children: [
                                Container(
                                  //   margin: EdgeInsets.only(bottom: height/3),
                                  child:  ListView(
                                    //padding: EdgeInsets.all(18),
                                    children: [
                                      //toolbar(theme),
                                      //Get the lines data
                                      getLinesList(theme, snapshot.data),
                                      //Get the detailed information on all the lines
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FlatButton(
                                            color: CustomColours.samidarkRed,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                            child: Text("View My Lines", style: theme.textTheme.bodyText1.copyWith(color: Colors.white)),
                                            onPressed: () =>
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => LinesScreen(widget.subscriber, snapshot.data))),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: height/10,),
                                      // Image.asset("assets/images/Two-senior-woman_1043661770.jpg",),

                                      /*   Positioned(
                                    bottom: 50,
                                    left: 0.0,
                                    right: 0.0,
                                    child:Image.asset("assets/images/Two-senior-woman_1043661770.jpg",),

                                  ),*/
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
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
                          '@2021 Patriot mobile',
                          style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                          textAlign: TextAlign.center,

                        ),

                      ],
                    )
                ),
                SizedBox(height: 20,),
              ],
            ),
          )
      );
    }
  }

  ///Get the lines data
  getLinesList(ThemeData theme, Map mapData) {
    //Load the values
    LinesDetailEntity linesDetail = mapData["linesDetail"];
    SubscriberDetail subscriberDetail = mapData["subscriberDetail"];
    BillingStatements billingStatements = mapData["billingStatement"];

    //Load the due date for this account and calculate the number of days left for the current billing period
    int intDaysLeft = 0;
    try {
      String strDueAt = billingStatements.billingStatements[0].dueAt.split("T").first;
      DateTime dtDueAt = DateFormat('yyyy-MM-dd').parse(strDueAt);
      intDaysLeft = dtDueAt.difference(DateTime.now()).inDays;
    } catch (e) {}

    //Count the total active lines
    int intTotalLines = 0;
    linesDetail.lines.forEach((element) {
      if (element.status == "active") intTotalLines++;
    });

    //return the column containing lines details
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      //  SizedBox(height: 10,),
        Container(
          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
          alignment:Alignment.bottomCenter,
          height:3.0,
          width:width,
          color:CustomColours.lightGrey,
        ),
        SizedBox(height: 10,),
        //Title
        Container(
          margin: EdgeInsets.only(left: 18,right: 18),
          alignment: Alignment.center,
          child: Text(
            "You have ${intTotalLines.toString()} lines  on this account",
            style: theme.textTheme.headline4.copyWith(color: CustomColours.appred,fontWeight: FontWeight.bold,fontFamily: 'Montserrat',fontSize: 20),
          textAlign: TextAlign.center,),
        ),
        SizedBox(height: 10,),
        Container(
          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
          alignment:Alignment.bottomCenter,
          height:3.0,
          width:width,
          color:CustomColours.lightGrey,
        ),
        SizedBox(height: 50,),
        Column(
         // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [   //Number of days left in the current bill cycle
            Padding(
                padding: const EdgeInsets.only(left: 18,right: 18),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      height: 10,
                      width: 7,
                      alignment: Alignment.bottomLeft,
                      //   margin: EdgeInsets.all(50.0),
                      decoration: BoxDecoration(
                          color: CustomColours.darkBlue,
                          shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 3,),
                    Container(
                      child: Text(
                        "${billingStatements.billingStatements[0].startAt.substring(0, 10)} - ${billingStatements.billingStatements[0].closedAt.substring(0, 10)}",
                        style: TextStyle(color: CustomColours.darkBlue,fontWeight: FontWeight.bold,fontSize: 16),
                      ),

                     /* child:  Text(
                        "${intDaysLeft.toString()} days left in this cycle.",
                        style: theme.textTheme.bodyText1.copyWith(color: CustomColours.darkBlue,fontFamily: 'Montserrat'),
                        textAlign: TextAlign.center,),*/
                    )
                    ,
                  ],
                )
            ),

            //Current balance
            Padding(
                padding: const EdgeInsets.only(left: 18,right: 18),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 7,
                        margin: EdgeInsets.only(top: 4),
                        alignment: Alignment.bottomLeft,
                        //   margin: EdgeInsets.all(50.0),
                        decoration: BoxDecoration(
                            color: CustomColours.darkBlue,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: 3,),
                      Text(
                        " You have \u0024${billingStatements.billingStatements[0].balance} balance on your account",
                        style: theme.textTheme.bodyText1.copyWith(color: CustomColours.darkBlue,fontFamily: 'Montserrat'),
                      ),
                    ]
                )
            ),],
        ),

        SizedBox(height: 10,),


      ],
    );
  }

  ///Get all the values fetched from the API
  Future<Map> getAllDetails() async {
    //Load the line and the subscriber detail
    LinesDetailEntity linesDetail = await getLinesData();
    print('lineData :-  ${linesDetail.lines[0].id}');
    print('lineLength :-  ${linesDetail.lines.length}');
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


  toolbar(ThemeData theme) {
    return  Container(
     // height: 20,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: Image.asset("assets/images/Arrow Back Gray.png",),

              onPressed: () {
                Navigator.pop(context);
              }),

          Align(
            alignment: Alignment.center,
            child:  Text('All your lines',style: theme.textTheme.bodyText2.copyWith(color: CustomColours.grayDark),),
          ),

          Container(),

        ],
      ),

    );
  }
}

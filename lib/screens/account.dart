import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/models/subscriber_detail.dart';
import 'package:mywebflutterapp/models/subscriber_statement.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';

class AccountScreen extends StatefulWidget {
  Subscriber subscriber;

  AccountScreen(this.subscriber);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Subscriber user;

  String welcomeMessage;
  double width, height;
  String appbarTitle = 'Billing';
  List<BillingStatement> billingStatement;
  int statusCount = 0;
  @override
  void initState() {
   /* Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });*/
    //Get the user
    user = widget.subscriber;

    //Initialize the welcome message
    if (DateTime.now().hour < 12) {
      welcomeMessage = "Good Morning";
    } else if (DateTime.now().hour >= 12 && DateTime.now().hour < 6) {
      welcomeMessage = "Good Afternoon";
    } else {
      welcomeMessage = "Good Evening";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
   // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
   // CollectionReference users = FirebaseFirestore.instance.collection('Device Manual');
    if ( (MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),

          body:Container(
            //color: Colors.black,
            padding: EdgeInsets.only(left: width/5,right: width/5),
            child: Stack(
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 110),
                  child: DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //   toolbar(theme),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Container(
                                    //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                                    alignment:Alignment.bottomCenter,
                                    height:4.0,
                                    width:width,
                                    color:CustomColours.lightGrey,
                                  ),
                                  TabBar(
                                    unselectedLabelColor: Colors.grey,
                                    labelColor: CustomColours.samidarkRed,
                                    //indicatorColor: Colors.red,
                                    indicatorWeight: 1,
                                    tabs: [
                                      Tab(
                                        child: Text("Current Bill",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18 ,fontFamily: 'Montserrat',),
                                        ),
                                      ),
                                      Tab(
                                        child: Text("History",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18 ,fontFamily: 'Montserrat',),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    //  margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                                    alignment:Alignment.bottomCenter,
                                    height:4.0,
                                    width:width,
                                    color:CustomColours.lightGrey,
                                  ),
                                ],
                              ),

                            ),
                            Container(
                                height: height/1.5,
                                //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Colors.grey, width: 0.5))
                                ),
                                child:  TabBarView(
                                  children: [
                                    //Get the Billing data
                                    getBillingDetail(theme),
                                    //Get the Billing history
                                    getBillingHistory(theme),
                                  ],
                                )
                            ),

                          ]
                      )
                  ),
                )
              ],
            ),
          )
      );

    }
    else if ( (MediaQuery.of(context).size.width > 650&& MediaQuery.of(context).size.width < 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          //Body
          body:Container(
            //color: Colors.black,
            padding: EdgeInsets.only(left: width/12,right: width/12),
            child: Stack(
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 110),
                  child: DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //   toolbar(theme),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Container(
                                    //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                                    alignment:Alignment.bottomCenter,
                                    height:4.0,
                                    width:width,
                                    color:CustomColours.lightGrey,
                                  ),
                                  TabBar(
                                    unselectedLabelColor: Colors.grey,
                                    labelColor: CustomColours.samidarkRed,
                                    //indicatorColor: Colors.red,
                                    indicatorWeight: 1,
                                    tabs: [
                                      Tab(
                                        child: Text("Current Bill",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18 ,fontFamily: 'Montserrat',),
                                        ),
                                      ),
                                      Tab(
                                        child: Text("History",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18 ,fontFamily: 'Montserrat',),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    //  margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                                    alignment:Alignment.bottomCenter,
                                    height:4.0,
                                    width:width,
                                    color:CustomColours.lightGrey,
                                  ),
                                ],
                              ),

                            ),
                            Container(
                                height: height/1.5,
                                //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Colors.grey, width: 0.5))
                                ),
                                child:  TabBarView(
                                  children: [
                                    //Get the Billing data
                                    getBillingDetail(theme),
                                    //Get the Billing history
                                    getBillingHistory(theme),
                                  ],
                                )
                            ),

                          ]
                      )
                  ),
                )
              ],
            ),
          )

        /*body: TabBarView(
          children: [
            //Get the Billing data
            getBillingDetail(theme),

            //Get the Billing history
            getBillingHistory(theme),
          ],
        ),*/
      );
    }
    else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          //Body
          body:Container(
            //color: Colors.black,
           // padding: EdgeInsets.only(left: width/5,right: width/5),
            child: Stack(
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 110),
                  child: DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //   toolbar(theme),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Container(
                                    //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                                    alignment:Alignment.bottomCenter,
                                    height:3.0,
                                    width:width,
                                    color:CustomColours.lightGrey,
                                  ),
                                  TabBar(
                                    unselectedLabelColor: Colors.grey,
                                    labelColor: CustomColours.samidarkRed,
                                    //indicatorColor: Colors.red,
                                    indicatorWeight: 1,
                                    tabs: [
                                      Tab(
                                        child: Text("Current Bill",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18 ,fontFamily: 'Montserrat',),
                                        ),
                                      ),
                                      Tab(
                                        child: Text("History",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18 ,fontFamily: 'Montserrat',),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    //  margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                                    alignment:Alignment.bottomCenter,
                                    height:3.0,
                                    width:width,
                                    color:CustomColours.lightGrey,
                                  ),
                                ],
                              ),

                            ),
                            Container(
                                height: height/1.5,
                                //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Colors.grey, width: 0.5))
                                ),
                                child:  TabBarView(
                                  children: [
                                    //Get the Billing data
                                    getBillingDetail(theme),
                                    //Get the Billing history
                                    getBillingHistory(theme),
                                  ],
                                )
                            ),

                          ]
                      )
                  ),
                )
              ],
            ),
          )

        /*body: TabBarView(
          children: [
            //Get the Billing data
            getBillingDetail(theme),

            //Get the Billing history
            getBillingHistory(theme),
          ],
        ),*/
      );
    }
  }
  toolbar(ThemeData theme) {
    return  Container(
      height: 60,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Image.asset("assets/images/Arrow Back Gray.png",),

              onPressed: () {
                Navigator.pop(context);
              }),

          Align(
            alignment: Alignment.center,
            child:  Text('Hello',style: theme.textTheme.bodyText2.copyWith(color: CustomColours.arealRagularGrey),),
          ),

          Container(),

        ],
      ),

    );
  }
  ///Get the lines data
  getBillingDetail(ThemeData theme) {
    //return the column containing lines details
    return FutureBuilder<BillingStatements>(
      future: fetchBillingDetail(),
      builder: (BuildContext context, AsyncSnapshot<BillingStatements> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
        if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));

        //Load the values
       /* Map mapData = snapshot.data;
        LinesDetail linesDetail = mapData["linesDetail"];
        SubscriberDetail subscriberDetail = mapData["subscriberDetail"];
        BillingStatements billingStatements = mapData["billingStatement"];*/

        BillingStatements billingStatements = snapshot.data;


        var states,balance;
        for(int i = 0;i<billingStatements.billingStatements.length;i++){
          if (billingStatements.billingStatements[i].state=='open') {
            states = billingStatements.billingStatements[i].dueAt.substring(0, 10);
            balance = billingStatements.billingStatements[i].balance;
          }
        }





        //Return all the cards populated
        return Stack(
          children: [
            Container(
             // margin: EdgeInsets.only(bottom: height/3),
              child:  ListView(
                //padding: EdgeInsets.all(18),
                children: [
                  //The Current outstanding amount

                  SizedBox(height: 10,),
                  Text(
                    "Your Latest Bill is ready.",
                    style: TextStyle(color: CustomColours.samidarkRed,fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'Montserrat',),
                   textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                   Container(
                    //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                    alignment:Alignment.bottomCenter,
                    height:3.0,
                    width:width,
                    color:CustomColours.lightGrey,
                  ),
                  SizedBox(height: 20,),
                 Container(
                   padding: EdgeInsets.only(left: 20,right: 20),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [                       //Time period of this Billing cycle
                       Padding(
                         padding: const EdgeInsets.only(top: 12),
                         child: Text(
                           "${billingStatements.billingStatements[0].createdAt.substring(0, 10)} - ${billingStatements.billingStatements[0].closedAt.substring(0, 10)}",
                           style: TextStyle(color: CustomColours.darkBlue,fontWeight: FontWeight.bold,fontSize: 16),
                         ),
                       ),

                       Text(
                      //   "\$${billingStatements.billingStatements[0].total}",
                         "\$${balance}",
                         style: TextStyle(color: CustomColours.darkBlue,fontWeight: FontWeight.bold,fontSize: 25),
                       ),

                     ],
                   ),
                 ),

                  SizedBox(height: 40,),
                 /* Container(
                    //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                    alignment:Alignment.bottomCenter,
                    height:3.0,
                    width:width,
                    color:CustomColours.lightGrey,
                  ),*/
                  //Other Jargon
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      "You have AutoPay scheduled for ${billingStatements.billingStatements[0]?.dueAt.substring(0, 10)}.",
                      style: TextStyle(color:CustomColours.darkGreen,fontWeight: FontWeight.bold,fontSize: 16),
                      textAlign: TextAlign.center,

                    ),
                  ),
                  SizedBox(height: height/10,),

                ],
              ),
            ),
            new Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Column(
                children: [
                  Container(
                    //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                    alignment:Alignment.bottomCenter,
                    height:4.0,
                    width:width,
                    color:CustomColours.lightGrey,
                  ),
                  SizedBox(height: height/30,),
                 Text(
                   '@2021 Patriot mobile',
                    style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                    textAlign: TextAlign.center,

                  ),

                ],
              )
            ),
          ],
        );
      },
    );
  }

  ///Get the lines data
  getBillingHistory(ThemeData theme) {
    //return the column containing lines details
    return FutureBuilder<BillingStatements>(
      future: fetchBillingHistory(),
      builder: (BuildContext context, AsyncSnapshot<BillingStatements> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
        if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));

        //Load the values
        BillingStatements billingStatements = snapshot.data;
        billingStatement = billingStatements.billingStatements;
        //Sort the data as latest to the oldest
      /*  billingStatements.billingStatements.sort((bs1, bs2) {
          try {
            //Get the "start_at" for both the Billing Statements
            DateTime dt1 = DateFormat('yyyy-MM-dd').parse(bs1.startAt.substring(0, 10));
            DateTime dt2 = DateFormat('yyyy-MM-dd').parse(bs1.startAt.substring(0, 10));

            if (dt1.isBefore(dt2)) {
              return -1;
            } else if (dt1.isAfter(dt2)) {
              return 1;
            } else {
              return 0;
            }
          } catch (e) {
            return 0;
          }
        });*/

        statusCount = 0;
        var states,balance;
        for(int i = 0;i<billingStatements.billingStatements.length;i++){
          if (billingStatements.billingStatements[i].state=='open') {
            states = billingStatements.billingStatements[i].dueAt.substring(0, 10);
            balance = billingStatements.billingStatements[i].balance;
          }
        }

        print( "To be paid before ${states}");
        print( "Tototal ${balance}");
        //Return all the cards populated
        return Stack(
          children: [
            Column(
              // padding: EdgeInsets.all(0),
              children: [
                //Here's your latest Billing activity.
                SizedBox(height: 10,),
                Padding(
                  padding:  EdgeInsets.only(left: 18,right: 18),
                  child: Text(
                    "Your latest Billing activity.",
                    style: TextStyle(color: CustomColours.samidarkRed,fontSize: 24,fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                  alignment:Alignment.bottomCenter,
                  height:3.0,
                  width:width,
                  color:CustomColours.lightGrey,
                ),
                SizedBox(height: 10,),

                Padding(
                  padding:  EdgeInsets.only(left: 18,right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To be paid before ${states}",
                        style: TextStyle(color: CustomColours.darkGreen,fontSize: 16,fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "\$${balance}",
                        style: TextStyle(color: CustomColours.darkGreen,fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                SizedBox(height: 20,),
                //Billing History
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 18,right: 18),
                  child: Text("Billing History", style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue,),
                    textAlign: TextAlign.start,),
                ),

                SizedBox(height: 20,),
                Container(
                  //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                  alignment:Alignment.bottomCenter,
                  height:4.0,
                  width:width,
                  color:CustomColours.lightGrey,
                ),
                SizedBox(height: 10,),
                //List of all the historical billings
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Title
                     Container(
                       padding: const EdgeInsets.only(left: 18,right: 18),
                        child:  Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           //Date

                           Text("Date", style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),),
                           //Status
                        Text("Status", style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',)),
                           //Amount
                      Text("Amount", style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',)),
                         ],
                       ),
                     ),
                      SizedBox(height: 10,),
                      Container(
                        //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                        alignment:Alignment.bottomCenter,
                        height:4.0,
                        width:width,
                        color:CustomColours.lightGrey,
                      ),

                      //List of all the cards populated
                      Container(
                        padding: const EdgeInsets.only(left: 18,right: 18),
                        height: height/3.2,
                        child:  ListView.builder(
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          itemCount:billingStatement.length-1,
                          itemBuilder: (BuildContext context, int index) {
                            print('statusamntp${billingStatement[index].total}');
                            //DateTime dt = DateFormat('yyyy-MM-dd').parse(billingStatements.billingStatements[index].closedAt.substring(0, 10));

                            return Center(
                                child: displayHistory(billingStatement,index,theme)
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                ),

              ],
            ),
            new Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Column(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                      alignment:Alignment.bottomCenter,
                      height:3.0,
                      width:width,
                      color:CustomColours.lightGrey,
                    ),
                    SizedBox(height: height/35,),
                    Text(
                      '@2021 Patriot mobile',
                      style: TextStyle(color:CustomColours.arealRagularGrey,fontWeight: FontWeight.normal,fontSize: 12),
                      textAlign: TextAlign.center,

                    ),

                  ],
                )
            ),
          ],
        );

      },
    );
  }

  ///Get the Current outstanding amount
  Future<BillingStatements> fetchBillingDetail() async {
    //Load the line and the subscriber detail
    print('linesDetail0 : ${'kjdfd'}');
    //LinesDetail linesDetail = await getLinesData();
   // print('linesDetail0 : ${linesDetail.lines[0].id}');
    SubscriberDetail subscriberDetail = await getSubscriberData();


   // print('billingDetails0 ${subscriberDetail.currentBillingStatementId.toString()}');

    //Load the billing details from the "current_billing_statement_id" field from the subscriber API
    BillingStatements billingStatements = await getBillingStatement(subscriberDetail.currentBillingStatementId.toString());

   // print('billingDetails1 ${billingStatements.billingStatements[0].total}');
    //Return the data
    return billingStatements;
    /*return {
      "linesDetail": linesDetail,
      "subscriberDetail": subscriberDetail,
      "billingStatement": billingStatements,
    };*/
  }

  ///Get the Current outstanding amount
  Future<BillingStatements> fetchBillingHistory() async {
    //print('hello1');
    //Load the line and the subscriber detail
    //LinesDetail linesDetail = await getLinesData();
    SubscriberDetail subscriberDetail = await getSubscriberData();
    print('hello2 ${subscriberDetail.currentBillingStatementId.toString()}');
    //Load the billing details from the "current_billing_statement_id" field from the subscriber API
    BillingStatements billingStatementsTMP = await getBillingStatement(subscriberDetail.currentBillingStatementId.toString());
   // print('hello2 ${subscriberDetail.currentBillingStatementId.toString()}');
    //Load the billing details from the "current_billing_statement_id" field from the subscriber API
    BillingStatements billingStatements = await getBillingStatementBySubId(
        subscriberDetail.currentBillingStatementId.toString(), billingStatementsTMP.billingStatements[0].subscriberId.toString());

    //Return the data
    return billingStatements;
  }

  Future<LinesDetailEntity> getLinesData() async => await APIClient().getLinesDetail(widget.subscriber.id.toString());

  Future<SubscriberDetail> getSubscriberData() async => await APIClient().getSingleSubDetail(widget.subscriber.id.toString());

  Future<BillingStatements> getBillingStatement(String billingStatementId) async =>
      await APIClient().getBillingStatement(billingStatementId);

  Future<BillingStatements> getBillingStatementBySubId(String billingStatementId, String subscriberId) async =>
      await APIClient().getBillingStatementBySubId(billingStatementId, subscriberId);

  String addZero(DateTime dt,int day) {
    if (day==0) {
      if (dt.day.toString().length==1) {

        String str = '0'+dt.day.toString();
      //  int dts = int.parse(str);
        print('daydder ${str}');
        return  str;
      }  else{
        return dt.day.toString();
      }
    } else{
      if (dt.month.toString().length==1) {

        String str = '0'+dt.month.toString();
        print('monthdder ${str}');
        return  str;
      }  else{
        return dt.month.toString();
      }
    }


  }

  displayHistory(List<BillingStatement> billingStatements,int index, ThemeData theme) {
    DateTime dt = DateFormat('yyyy-MM-dd').parse(billingStatements[index].closedAt.substring(0, 10));
    print('datee ${dt}');

    for(int i=billingStatements.length-index-2;i>=1;i--){
      if (billingStatements[i].status=='Paid') {
        statusCount = statusCount+1;
        if (statusCount<7) {
          print('statusamnt ${statusCount}');
          print('si ${i}');
          // print('statusamntp${billingStatements[i].total}');
          dt = DateFormat('yyyy-MM-dd').parse(billingStatements[i].closedAt.substring(0, 10));
          return Stack(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Date
              SizedBox(height: 30,),

              Align(alignment: Alignment.centerLeft,
                child: Text("${billingStatements[i].closedAt.substring(0, 10)}",
                //child: Text("${dt.day} / ${dt.month}",
                  style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal,color: CustomColours.grayDark),
                  textAlign: TextAlign.left,
                ),),

              //Status

              Align(alignment: Alignment.center,
                child:  Text(
                  billingStatements[i].status,
                  style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal,color: CustomColours.grayDark),
                  textAlign: TextAlign.left,
                ),
              ),
              //Amount

              Align(alignment: Alignment.centerRight,
                child:Text("\$${billingStatements[i].total}",
                    style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),
                    textAlign: TextAlign.left
                ),

              ),
            ],
          );
        }
      }
    }


  }

}

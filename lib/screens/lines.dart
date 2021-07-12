import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/get_all_billing_statements_id_entity.dart';
import 'package:mywebflutterapp/models/get_service_usage_summary_data_entity.dart';
import 'package:mywebflutterapp/models/line_detail.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/models/subscriber_detail.dart';
import 'package:mywebflutterapp/services/api_client.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';



class LinesScreen extends StatefulWidget {
  final Subscriber subscriber;
  final Map mapPlanDetails;

  LinesScreen(this.subscriber, this.mapPlanDetails);

  @override
  _LinesScreenState createState() => _LinesScreenState();
}
enum LegendShape { Circle, Rectangle }
class _LinesScreenState extends State<LinesScreen> {
  //Get the line information
  LinesDetailEntity linesDetail;
  SubscriberDetail subscriberDetail;
  double width, height;
  String appbarTitle = 'Account Overview';
  List<GetServiceUsageSummaryDataEntity> getserviceUsageSummaryList;
  bool isOdd = false;
  @override
  void initState() {
    linesDetail = widget.mapPlanDetails["linesDetail"] ?? new List();
    subscriberDetail = widget.mapPlanDetails["subscriberDetail"] ?? new List();
    getServicePeriod();
       print('currentBillingStatementIdss ${subscriberDetail.currentBillingStatementId.toString()}');
    super.initState();
  }
  Map<String, double> dataMap = {
    " ": 5,
  };
  List<Color> colorList = [
    Colors.blue,
  ];
  LegendShape _legendShape = LegendShape.Circle;
  String dataPlan;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    if ( (MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body:Container(
            padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //  toolbar(theme),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 0,),
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
                                        child: Text("CURRENT USAGE",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16 ,fontFamily: 'Montserrat',),
                                        ),
                                      ),
                                      Tab(
                                        child: Text("HISTORY",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16 ,fontFamily: 'Montserrat',),
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
                                height: height/1.8,
                                //  margin: EdgeInsets.only(bottom: 20),
                                //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Colors.grey, width: 0.5))
                                ),
                                child:  TabBarView(
                                  children: [

                                    getBillWidget(theme),

                                    getBillHistoryWidget(theme)

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
    } else if ( (MediaQuery.of(context).size.width > 650&& MediaQuery.of(context).size.width < 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body:Container(
            padding: EdgeInsets.only(left: width/12,right: width/12),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //  toolbar(theme),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 0,),
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
                                        child: Text("CURRENT USAGE",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16 ,fontFamily: 'Montserrat',),
                                        ),
                                      ),
                                      Tab(
                                        child: Text("HISTORY",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16 ,fontFamily: 'Montserrat',),
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
                                height: height/1.8,
                                //  margin: EdgeInsets.only(bottom: 20),
                                //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Colors.grey, width: 0.5))
                                ),
                                child:  TabBarView(
                                  children: [

                                    getBillWidget(theme),

                                    getBillHistoryWidget(theme)

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
    }  else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body:Container(
           // padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //  toolbar(theme),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 0,),
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
                                        child: Text("CURRENT USAGE",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16 ,fontFamily: 'Montserrat',),
                                        ),
                                      ),
                                      Tab(
                                        child: Text("HISTORY",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16 ,fontFamily: 'Montserrat',),
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
                                height: height/1.8,
                                //  margin: EdgeInsets.only(bottom: 20),
                                //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(color: Colors.grey, width: 0.5))
                                ),
                                child:  TabBarView(
                                  children: [

                                    getBillWidget(theme),

                                    getBillHistoryWidget(theme)

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
            child:  Text('All your lines',style: theme.textTheme.bodyText2.copyWith(color: CustomColours.grayDark),),
          ),

         Container(),

        ],
      ),

    );
  }
  ///Get the details od all the lines
  getBillWidget(ThemeData theme) {
    return Stack(
      children: [
         ListView.builder(
          itemCount: linesDetail.lines.length,
          itemBuilder: (BuildContext context, int index) {
            //Load the details for all the lines
            if (linesDetail.lines[index].status == "active") {

              return FutureBuilder<LineDetail>(
                future: getSubscriberDataBybothID(subscriberDetail.currentBillingStatementId.toString(),linesDetail.lines[index].id.toString()),
               // future: getSubscriberData(linesDetail.lines[index].id.toString()),
                builder: (BuildContext context, AsyncSnapshot<LineDetail> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) return Center(child: Container(color: Colors.transparent,));
                  //  if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                  if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));
                  List<Buckets> lstBuckets = snapshot.data.buckets ?? new List<Buckets>();
                  var planName =  lstBuckets.first.plan.name;
                  return Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left:width/12,right:width/12,bottom: 3),
                      child:Column(
                        children: [



                          Container(
                            // height:  height/7.2,
                            color: Colors.white,
                            //padding: EdgeInsets.all(10),
                            padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: ExpansionTile(
                              title: Container(
                                //color: Colors.yellow,
                                padding: EdgeInsets.only(top: 0,left: 10,bottom: 10),
                                child: Column(

                                  children: [

                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(linesDetail.lines[index].mdn ?? "",  style: theme.textTheme.headline5.copyWith(color: CustomColours.appred,fontSize: 14),
                                        textAlign: TextAlign.left,),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Plan',  style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontSize: 12),
                                                textAlign: TextAlign.left,),
                                              Container(
                                                width: width/4,
                                                child: Text('${planName??''}',  style: theme.textTheme.headline5.copyWith(color: CustomColours.arealRagularGrey,fontSize: 12),
                                                  textAlign: TextAlign.right,),
                                              )

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Make Model',  style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontSize: 12),
                                                textAlign: TextAlign.left,),

                                              Text(linesDetail.lines[index].model,  style: theme.textTheme.headline5.copyWith(color: CustomColours.arealRagularGrey,fontSize: 12),
                                                textAlign: TextAlign.left,),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('ICCID',  style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontSize: 12),
                                                textAlign: TextAlign.left,),
                                              Text(linesDetail.lines[index].iccid,  style: theme.textTheme.headline5.copyWith(color: CustomColours.arealRagularGrey,fontSize: 12),
                                                textAlign: TextAlign.left,),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              //Body
                              children: <Widget>[
                                Container(
                                  //  margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                                  alignment:Alignment.bottomCenter,
                                  height:4.0,
                                  width:width,
                                  color:CustomColours.lightGrey,
                                ),
                                Container(
                                    color:Colors.white,

                                    child: FutureBuilder<Map>(
                                      //future: getSubscriberData(linesDetail.lines[index].id.toString()),
                                      future: getBucketDate(snapshot.data),
                                      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                                        if (snapshot.connectionState == ConnectionState.none || snapshot.data == null)
                                          return Center(child: Text("No data found"));
                                        //Return all the cards populated
                                        //linesDetail = widget.mapPlanDetails["lstBuckets"] ?? new List();
                                        List<Buckets> lstBuckets = snapshot.data["lstBuckets"] ;
                                        print('lstBucketsvv:- ${lstBuckets[0]?.services[0].service}');
                                        // return lstBuckets?.last?.services?.length!=0
                                        for(int i = 0;i<lstBuckets.length;i++){
                                          //  print('dataSErvices:- ${lstBuckets[i]?.services[0].service}');
                                          for(int j= 0;j<lstBuckets[i]?.services.length;j++){
                                            if (lstBuckets[i]?.services[j].service=='data') {
                                              print('dataSErvicesvalue:- ${lstBuckets[i]?.services[j].service}');
                                              print('dataSErvicesREmaning:- ${lstBuckets[i]?.services[j].remainingUnits}');


                                              return lstBuckets[i]?.services?.length!=0?Column(
                                                //mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [

                                                  //Your Usage
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                                                    child: Text("Your Usage", style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontWeight: FontWeight.bold,fontSize: 20)),
                                                  ),

                                                  //Your Usage
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        //Service name
                                                        Container(
                                                          width:width,
                                                          padding: const EdgeInsets.only(top: 2, left: 8, right: 8),
                                                          child: Text(lstBuckets[i]?.plan?.name??''),
                                                        ),

                                                        //The plan name

                                                        SizedBox(height: 20,),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,

                                                          children: [
                                                            //SizedBox(width: 10,),
                                                            Container(
                                                              margin: EdgeInsets.only(left: 30),
                                                              child: new CircularPercentIndicator(
                                                                radius: 80.0,
                                                                lineWidth: 10.0,
                                                                animation: true,
                                                                percent:percents(lstBuckets[i]?.services[j]?.remainingUnits,lstBuckets[i]?.services[j]?.totalUnits),
                                                                // percent: 100 / 100,
                                                                circularStrokeCap: CircularStrokeCap.square,
                                                                backgroundColor: CustomColours.blueProgressBackground,
                                                                progressColor: CustomColours.blueProgressIndicator,
                                                              ),
                                                            ),
                                                            //SizedBox(width: 20,),
                                                            //  Text('hellos'),
                                                            Container(
                                                              margin: EdgeInsets.only(left: 30),
                                                              alignment: Alignment.center,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    width: width/4,
                                                                    alignment:Alignment.centerLeft,
                                                                    //padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                                                    child: Text(
                                                                      //"75 %",
                                                                      "${fullpercents(lstBuckets[i]?.services[j]?.remainingUnits,lstBuckets[i]?.services[j]?.totalUnits)} % Remaining",
                                                                      style: theme.textTheme.bodyText1.copyWith(color: CustomColours.blueProgressIndicator,fontWeight: FontWeight.bold,fontSize: 25),
                                                                      textAlign: TextAlign.left, ),
                                                                  ),
                                                                  Container(
                                                                    //padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                                                    alignment:Alignment.centerLeft,
                                                                    child: Text(
                                                                      //  'ff',
                                                                        lstBuckets[i]?.services[j]?.totalUnits!='unlimited'?"${usedUnitGb(lstBuckets[i]?.services[j]?.usedUnits)} GB used out of ${totalGb(lstBuckets[i]?.services[j]?.totalUnits)} GB":"Unlimited(${usedUnitGb(lstBuckets[i]?.services[j]?.usedUnits)}GB used)",
                                                                        style: theme.textTheme.bodyText1.copyWith(color: CustomColours.blueProgressBackground)),
                                                                  ),
                                                                ],
                                                              ),
                                                            )

                                                          ],
                                                        ),

                                                      ],
                                                    ),),

                                                  //SizedBox(width: 30,),
                                                  //Device information
                                                  Container(
                                                      margin: EdgeInsets.only(top: 20),
                                                      color: CustomColours.lightGrey,
                                                      padding: EdgeInsets.only(bottom: 0),
                                                      child:Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,

                                                        children: [
                                                          //Your Device
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [

                                                              //Device information
                                                              Container(
                                                                margin: EdgeInsets.only(left: 20),
                                                                child: Column(
                                                                  // mainAxisSize: MainAxisSize.max,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    Text("Your Device",  style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontSize: 20,fontWeight: FontWeight.bold)),
                                                                    //Device information
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                                                      child: Text(
                                                                        "${linesDetail.lines[index].manufacturer}",
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                                                                      child: Text(
                                                                        "${linesDetail.lines[index].model}",
                                                                      ),
                                                                    ),

                                                                  ],
                                                                ),
                                                              ),
                                                              //Phone Image
                                                              Container(
                                                                margin: EdgeInsets.only(right: 20),
                                                                child: Image.asset(
                                                                  "assets/images/google-nexus6p-portrait.png",
                                                                  width: width/6,height: height/12, ),
                                                              )
                                                            ],
                                                          ),
                                                          //Phone Image
                                                          Container(
                                                              margin: EdgeInsets.only(left:20,right: 20),
                                                              child:  Row(
                                                                children: [
                                                                  Text("IMEI  ",  style: theme.textTheme.headline5.copyWith(color: CustomColours.appred,fontWeight: FontWeight.bold,fontSize: 16)),
                                                                  //Device information
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(top: 0, left: 8, right: 8),
                                                                    child: Text(
                                                                      '${linesDetail.lines[index].imei}',
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                          ),
                                                          Container(
                                                              margin: EdgeInsets.only(left:20,right: 20),
                                                              child:  Row(
                                                                children: [
                                                                  Text("ICCID",  style: theme.textTheme.headline6.copyWith(color: CustomColours.appred,fontWeight: FontWeight.bold,fontSize: 16)),
                                                                  //Device information
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(top: 0, left: 8, right: 8),
                                                                    child: Text(
                                                                      '${linesDetail.lines[index].iccid}',
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                          )





                                                        ],
                                                      )


                                                  ),
                                                  //  Divider(indent: 8, thickness: 6, endIndent: 8),
                                                ],
                                              )
                                                  : Center(
                                                  child: Container(
                                                    height: 70,
                                                    alignment: Alignment.center,
                                                    child: Text('No data found'),
                                                  )
                                              );
                                            }
                                          }
                                        };

                                      },
                                    )

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
                          )
                        ],
                      )
                  );
                },
              );

            } else {
              return Container();
            }
          },
        )
      ],
    );
  }

  ///Get the details od all the lines
  getBillHistoryWidget(ThemeData theme) {
    return ListView.builder(
      itemCount: linesDetail.lines.length,
      itemBuilder: (BuildContext context, int index) {
        //Load the details for all the lines

        if (linesDetail.lines[index].status == "active") {

          return FutureBuilder<LineDetail>(
            future: getSubscriberDataBybothID(subscriberDetail.currentBillingStatementId.toString(),linesDetail.lines[index].id.toString()),
            // future: getSubscriberData(linesDetail.lines[index].id.toString()),
            builder: (BuildContext context, AsyncSnapshot<LineDetail> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) return Center(child: Container(color: Colors.transparent,));
              //if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
              if (snapshot.connectionState == ConnectionState.none || snapshot.data == null) return Center(child: Text("No data found"));
              List<Buckets> lstBuckets = snapshot.data.buckets ?? new List<Buckets>();
              var planName =  lstBuckets.first.plan.name;

              // getLineRecurringPlan(index);
              return  Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left:width/12,right:width/12,bottom: 3),
                child:  Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(

                      ),

                      child: ExpansionTile(
                        //Title - Phone number
                        title: Container(
                          padding: EdgeInsets.only(top: 0,left: 10,bottom: 10),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(linesDetail.lines[index].mdn ?? "",  style: theme.textTheme.headline5.copyWith(color: CustomColours.appred,fontSize: 14),
                                  textAlign: TextAlign.left,),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10,right: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Plan',  style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontSize: 12),
                                          textAlign: TextAlign.left,),
                                        Container(
                                          width: width/4,
                                         // child:  Text('${planName??''} ',  style: theme.textTheme.headline5.copyWith(color: CustomColours.arealRagularGrey,fontSize: 12),
                                          child:  Text('${planName??''}',  style: theme.textTheme.headline5.copyWith(color: CustomColours.arealRagularGrey,fontSize: 12),
                                          textAlign: TextAlign.right,),
                                        )

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Make Model',  style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontSize: 12),
                                          textAlign: TextAlign.left,),
                                        Text(linesDetail.lines[index].model,  style: theme.textTheme.headline5.copyWith(color: CustomColours.arealRagularGrey,fontSize: 12),
                                          textAlign: TextAlign.left,),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('ICCID',  style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontSize: 12),
                                          textAlign: TextAlign.left,),
                                        Text(linesDetail.lines[index].iccid,  style: theme.textTheme.headline5.copyWith(color: CustomColours.arealRagularGrey,fontSize: 12),
                                          textAlign: TextAlign.left,),

                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        //Body
                        children: <Widget>[
                          Container(
                            color:Colors.white,
                          child:FutureBuilder<Map>(
                            //future: getSubscriberData(linesDetail.lines[index].id.toString()),
                            future: getBucketDate(snapshot.data),
                            //future: getServicePeriod(),
                            builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                              if (snapshot.connectionState == ConnectionState.none || snapshot.data == null)
                                return Center(child: Text("No data found"));
                              //Return all the cards populated
                              //linesDetail = widget.mapPlanDetails["lstBuckets"] ?? new List();
                              List<Buckets> lstBuckets = snapshot.data["lstBuckets"] ;
                              //print('lstBucketsvv:- ${lstBuckets[0]?.services[0].service}');
                              // return lstBuckets?.last?.services?.length!=0
                              return lstBuckets?.length!=0 ? Container(
                                color:CustomColours.lightGrey,
                                //height: height,
                                child: Column(
                                  mainAxisAlignment:MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                                      alignment: Alignment.centerLeft,
                                      child: Text("Usage Summary",  style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontSize: 16),
                                        textAlign: TextAlign.left,),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 15,right: 15,top: 0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(linesDetail.lines[index].mdn ?? "",  style: theme.textTheme.headline5.copyWith(color: CustomColours.arealRagularGrey,fontSize: 16),
                                        textAlign: TextAlign.left,),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      padding: EdgeInsets.only(left: 15,right: 15,top: 0),
                                      alignment: Alignment.centerLeft,
                                      child: Text("Service Period",  style: theme.textTheme.headline5.copyWith(color: CustomColours.darkBlue,fontSize: 16),
                                        textAlign: TextAlign.left,),
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount:getserviceUsageSummaryList.length,
                                        itemBuilder: (BuildContext context, int usageindex) {
                                          String voice = '0.0';
                                          String text = '0.0';
                                          String data = '0.0';
                                          String  servicePeriod;
                                         if (true) {
                                               for(int i = 0;i<getserviceUsageSummaryList[usageindex]?.lines.length;i++){
                                              print("mdnnns ${getserviceUsageSummaryList[usageindex]?.lines[i].lineId}");
                                              if (getserviceUsageSummaryList[usageindex]?.lines[i].lineId==linesDetail.lines[index].id) {
                                                print('usedddata ${getserviceUsageSummaryList[usageindex]?.lines[i]?.usage?.data?.used}');

                                                data = usedUnitGb(getserviceUsageSummaryList[usageindex]?.lines[i]?.usage?.data?.used);
                                              }
                                              if (getserviceUsageSummaryList[usageindex]?.lines[i].lineId==linesDetail.lines[index].id) {
                                                print('usedddTExt ${getserviceUsageSummaryList[usageindex]?.lines[i]?.usage?.text?.used}');
                                                text = getserviceUsageSummaryList[usageindex]?.lines[i]?.usage?.text?.used;
                                              }
                                              if (getserviceUsageSummaryList[usageindex]?.lines[i].lineId==linesDetail.lines[index].id) {
                                                print('usedddVoice ${getserviceUsageSummaryList[usageindex]?.lines[i]?.usage?.voice?.used}');
                                                voice = getserviceUsageSummaryList[usageindex]?.lines[i]?.usage?.voice?.used;
                                              }
                                            }
                                            servicePeriod = "${getserviceUsageSummaryList[usageindex]?.startAt.substring(0, 10)} - ${getserviceUsageSummaryList[usageindex]?.closeAt.substring(0, 10)}";

                                            // print('${lstBuckets[index]?.services[0]?.usedUnits}');

                                             /* if(index!=0){
                                              for(int i=0; i<lstBuckets[index]?.services?.length;i++) {
                                                if (lstBuckets[index]?.services[i]?.service == 'voice') {
                                                  voice = lstBuckets[index]?.services[i]?.usedUnits;
                                                  print('voicec ${voice}');
                                                }
                                                if (lstBuckets[index]?.services[i]?.service == 'text') {
                                                  text = lstBuckets[index]?.services[i]?.usedUnits;
                                                  print('textc ${text}');
                                                }
                                                if (lstBuckets[index]?.services[i]?.service == 'data') {
                                                  data = usedUnitGb(lstBuckets[index]?.services[i]?.usedUnits);
                                                  print('datac ${data}');
                                                }
                                              }
                                            }*/
                                            return Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      top: 0),
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  child: Text(
                                                    // "29/04/2021 - 29/05/2021",
                                                    "${servicePeriod}",
                                                    style: theme.textTheme
                                                        .headline5.copyWith(
                                                        color: CustomColours
                                                            .appred,
                                                        fontSize: 14),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(height: 2,),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                      top: 10),
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(child: Text("VOICE",
                                                        style: theme.textTheme
                                                            .headline5
                                                            .copyWith(
                                                            color: CustomColours
                                                                .darkBlue,
                                                            fontSize: 14),
                                                        textAlign: TextAlign
                                                            .center,),flex: 1,),
                                                      Expanded(child: Text("TEXT",
                                                        style: theme.textTheme
                                                            .headline5
                                                            .copyWith(
                                                            color: CustomColours
                                                                .darkBlue,
                                                            fontSize: 14),
                                                        textAlign: TextAlign
                                                            .center,),flex: 1),
                                                      Expanded(child: Text("DATA",
                                                        style: theme.textTheme
                                                            .headline5
                                                            .copyWith(
                                                            color: CustomColours
                                                                .darkBlue,
                                                            fontSize: 14),
                                                        textAlign: TextAlign
                                                            .center,),flex: 1),

                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  //  margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                                                  alignment: Alignment
                                                      .bottomCenter,
                                                  height: 2.0,
                                                  width: width,
                                                  color: Colors.white,
                                                ), //white line
                                                Container(
                                                  //color: CustomColours.lightGrey,
                                                  padding: EdgeInsets.only(left: 15, right: 15),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(child:  Text(
                                                        "${voice}",
                                                        style: theme.textTheme
                                                            .headline5
                                                            .copyWith(
                                                            color: CustomColours
                                                                .arealRagularGrey,
                                                            fontSize: 14),
                                                        textAlign: TextAlign
                                                            .center,),flex: 1,),

                                                      Expanded(child: Text(
                                                        "${text}",
                                                        style: theme.textTheme
                                                            .headline5
                                                            .copyWith(
                                                            color: CustomColours
                                                                .arealRagularGrey,
                                                            fontSize: 14),
                                                        textAlign: TextAlign
                                                            .center,),flex: 1,),

                                                      Expanded(child: Text(
                                                        "${data}",
                                                        style: theme.textTheme
                                                            .headline5
                                                            .copyWith(
                                                            color: CustomColours
                                                                .arealRagularGrey,
                                                            fontSize: 14),
                                                        textAlign: TextAlign
                                                            .center,),flex: 1,),

                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 0,),
                                              ],
                                            );
                                          } else{
                                            return Container();
                                          }
                                        }),
                                    SizedBox(height: 0,),
                                  ],
                                ),
                              )
                                  : Center(
                                  child: Container(
                                    height: 70,
                                    alignment: Alignment.center,
                                    child: Text('No data found'),
                                  )
                              );
                            },
                          )
                          )
                        ],
                      ),


                      /*  child:Theme(
                    data: ThemeData.dark()
                        .copyWith(accentColor: Colors.white, primaryColor: Colors.white,dividerColor: Colors.transparent),

                  ),*/
                    )
                  ],
                ),
              );


            },
          );


        } else {
          return Container();
        }
      },
    );
  }

  ///Get the individual line data
  Future<LineDetail> getSubscriberData(String lineID) async => await APIClient().getLineDetail(lineID);
  ///Get the individual line data by currentBillingStatementId and linen id
  Future<LineDetail> getSubscriberDataBybothID(String currentBillingStatementId, String lineID) async => await APIClient().getLineDetailbyBothID(currentBillingStatementId,lineID);
  Widget expansionTileTest(context) {
    return Container(
      color: Colors.grey,
      child: ExpansionTile(
        title: Text(
          "Title",
          style: TextStyle(color: Colors.black),
        ),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            color: Colors.yellow,
            child: Center(child: Text("Hi")),
          ),
        ],
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

  double percents(var remaining_units,String totalUnits) {
    print('remaining_unitsrrr=  ${remaining_units}');
    print('totalUnits=  ${totalUnits}');
    if(remaining_units=='unlimited'||totalUnits=='unlimited'){
      return  100/100;
    }else{

      double rem  =    double.parse('$remaining_units');
      double totalu   =    double.parse('$totalUnits');
      print('rem=  ${rem}');
      print('totalu=  ${totalu}');
      print('percent=  ${rem/totalu}');
      double percent = rem/totalu;
      print('pppp ${percent.toStringAsFixed(2)}');
      return   percent;
    }

  }

  String fullpercents(var remaining_units,String totalUnits) {
    print('remaining_unitsrrr=  ${remaining_units}');
    print('totalUnits=  ${totalUnits}');
    if(remaining_units=='unlimited'||totalUnits=='unlimited'){
      return  ((100/100)*100).toStringAsFixed(0);
    }else{

      double rem  =    double.parse('$remaining_units');
      double totalu   =    double.parse('$totalUnits');
      print('rem=  ${rem}');
      print('totalu=  ${totalu}');
      print('percent=  ${rem/totalu}');

      double percent = (rem/totalu)*100;
      print('fullpercent=  ${rem/totalu}');
      return   percent.toStringAsFixed(0);
    }
  }

  String totalGb(String totalUnits) {
    print('totalUnitsss ${totalUnits}');
    if(totalUnits=='unlimited'){
      return  (100).toStringAsFixed(0);
    }else{
      double totalu   =    double.parse('$totalUnits');
      return  (totalu/(1024 * 1024)).toStringAsFixed(0);
    }
  }
  String usedUnitGb(String usedUnits) {
    print('totalUnitsss ${usedUnits}');
    if(usedUnits=='unlimited'){
      return  (100).toString();
    }else{
      double totalu   =    double.parse('$usedUnits');
      return  (totalu/(1024 * 1024)).toStringAsFixed(2);
    }
  }

  Future<Map> getBucketDate(LineDetail data) async{
    List<Buckets> lstBuckets = data.buckets ?? new List<Buckets>();
    return {
      "lstBuckets": lstBuckets,
    };
  }



  getServicePeriod() async{

    GetAllBillingStatementsIdEntity getAllBillingStatements = await getBillingStatmnt(widget.subscriber.id.toString());
    print('billingstatemntsIn_Line  ${getAllBillingStatements.billingStatements.length}');
    print('LastbillingstatemntsID  ${getAllBillingStatements.billingStatements.last.id}');
    List<GetAllBillingStatemantsIdBillingStatemants> billingStatementsList = getAllBillingStatements.billingStatements.reversed.toList();
    print('LastbillingstatemntsID  ${billingStatementsList.first.id}');

    getserviceUsageSummaryList = new List<GetServiceUsageSummaryDataEntity>();
    GetServiceUsageSummaryDataEntity getServiceUsageSummaryDataEntity;
    for(int i=0;i<3;i++){
      print('billingstmntInFor ${billingStatementsList[i].id}');
      getServiceUsageSummaryDataEntity = new GetServiceUsageSummaryDataEntity();
      getServiceUsageSummaryDataEntity = await getHistoryUsageSummary('${billingStatementsList[i].id}');
      // getServiceUsageSummaryDataEntity = await getHistoryUsageSummary('${1411650}');
      //getServiceUsageSummaryDataEntity = await getHistoryUsageSummary('${1430349}');
      getServiceUsageSummaryDataEntity.startAt = '${billingStatementsList[i].startAt}';
      getServiceUsageSummaryDataEntity.closeAt= '${billingStatementsList[i].closedAt}';
      getserviceUsageSummaryList.add(getServiceUsageSummaryDataEntity);
    }

    /* print('servicePeriodDate  ${getserviceUsageSummaryList.length}');
    print('servicePeriodDate  ${getserviceUsageSummaryList[0].startDate}');
    print('servicePeriodDate  ${getserviceUsageSummaryList[1].startDate}');
    print('servicePeriodDate  ${getserviceUsageSummaryList[2].startDate}');*/
  }
  Future<GetAllBillingStatementsIdEntity> getBillingStatmnt(String subscriberId) async => await APIClient().getAllBillingstatements(subscriberId);
  Future<GetServiceUsageSummaryDataEntity> getHistoryUsageSummary(String billsmntId) async => await APIClient().getHistoryUsageSummary(billsmntId);


}

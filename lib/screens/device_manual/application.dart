import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/models/subscriber_detail.dart';
import 'package:mywebflutterapp/models/subscriber_statement.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';


import '../account.dart';
import 'device_manuals.dart';

class Application extends StatefulWidget {
  final Map mapData;
  final Subscriber subscriber;
  Application(this.subscriber,this.mapData);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  double width, height;
  String appbarTitle = 'Device Manuals';
 // Map mapFunction1;


  static const pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,color: Colors.black,fontFamily: 'Montserrat',),
    bodyTextStyle: TextStyle(fontSize: 18.0,color: Color.fromRGBO(157, 159, 161, 1),),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    imagePadding: EdgeInsets.only(top: 0),
    pageColor: Colors.white,
  );


  List<PageViewModel> lstPages ;



  List<Widget> _samplePages;
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    Map  mapFunction1;
    for(int i=0;i<widget.mapData.length;i++){
        mapFunction1 = widget.mapData.values.elementAt(i);

      print('mapFunction1 ${mapFunction1}');
     // print('immmmm ${mapFunction1["contents"][i]["image"]}');
    }

    print('mapFunction1111 ${mapFunction1["contents"]}');
    //print('immmmm ${mapFunction1["contents"][0]["image"]}');
   // print('immmmm ${mapFunction1["contents"][1]["image"]}');

    _samplePages = [
      Center(
        child: Column(
          children: [
            Image.asset(mapFunction1["contents"][0]["image"]),
            Container(
              child: Text('Step 1'),
            ),
            Container(
              child: Text('${mapFunction1["contents"][0]["step"]}'),
            )
          ],
        )
      ),
      Center(
          child: Column(
            children: [
              Image.asset(mapFunction1["contents"][1]["image"]),
              Container(
                child: Text('Step 2'),
              ),
              Container(
                child: Text('Select Sounds & Haptics'),
              )
            ],
          )
      ),
    ];

    lstPages = [
      PageViewModel(
        title: 'Step 1',
        body: "${mapFunction1["contents"][0]["step"]}",
        image: Image.asset(mapFunction1["contents"][0]["image"]),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'Step 2',
        body: "Select Sounds & Haptics",
        image: Image.asset(mapFunction1["contents"][1]["image"]),
        decoration: pageDecoration,
      ),

    ];


 if ( (MediaQuery.of(context).size.width > 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body: Container(
            padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: ListView.builder(
                    itemCount: widget.mapData.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map mapFunction = widget.mapData.values.elementAt(index);

                      return Column(
                        children: [
                          //toolbar(theme),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          SizedBox(height: 18,),
                          //Title
                          //  Text(mapFunction["title"], style: theme.textTheme.headline5.copyWith(color: theme.accentColor)),
                          Text('CHANGE RINGTONE', style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),   ),
                          SizedBox(height: 18,),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          //Steps
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //height: MediaQuery.of(context).size.height - 100,
                            height: MediaQuery.of(context).size.height/1.8,
                            child: PageView.builder(
                              controller: _controller,
                              itemCount: mapFunction["contents"].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      //Body
                                      Column(
                                        children: [
                                          Padding(padding: EdgeInsets.all(12)),
                                          //Step
                                          Container(
                                            alignment:Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${changeStep(index)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            alignment:Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${indexPosition(index,mapFunction)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.grayDark),
                                            ),
                                          ),
                                          //Image
                                          Padding(
                                            padding: const EdgeInsets.all(32),
                                            child: Image.network(
                                              mapFunction["contents"][index]["image"],
                                              height: MediaQuery.of(context).size.height/1.9 * 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          //Swipe text
                          Container(
                            color: CustomColours.lightGrey,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(Icons.navigate_before),
                                  onPressed: () {
                                    _controller.previousPage(
                                        duration: _kDuration, curve: _kCurve);
                                  },
                                ),
                                FlatButton(
                                  child: Icon(Icons.navigate_next),
                                  onPressed: () {
                                    _controller.nextPage(duration: _kDuration, curve: _kCurve);
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                new Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 15.0,
                    child: Container(
                      color: Colors.white,
                      child:  Column(
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
                    )
                ),
              ],

            ),
          )
      );
    } else if ( (MediaQuery.of(context).size.width > 650&& MediaQuery.of(context).size.width < 800)) {
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body: Container(
            padding: EdgeInsets.only(left: width/12,right: width/12),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    itemCount: widget.mapData.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map mapFunction = widget.mapData.values.elementAt(index);
                      return Column(
                        children: [
                          //toolbar(theme),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          SizedBox(height: 18,),
                          //Title
                          //  Text(mapFunction["title"], style: theme.textTheme.headline5.copyWith(color: theme.accentColor)),
                          Text('CHANGE RINGTONE', style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),   ),
                          SizedBox(height: 18,),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          //Steps
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //height: MediaQuery.of(context).size.height - 100,
                            height: MediaQuery.of(context).size.height/1.5,
                            child: PageView.builder(
                              controller: _controller,
                              itemCount: mapFunction["contents"].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      //Body
                                      Column(
                                        children: [
                                          Padding(padding: EdgeInsets.all(12)),
                                          //Step
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${changeStep(index)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${indexPosition(index,mapFunction)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.grayDark),
                                            ),
                                          ),
                                          //Image
                                          Padding(
                                            padding: const EdgeInsets.all(32),
                                            child: Image.network(
                                              mapFunction["contents"][index]["image"],
                                              height: MediaQuery.of(context).size.height/1.6 * 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          //Swipe text
                          Container(
                            color: CustomColours.lightGrey,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(Icons.navigate_before),
                                  onPressed: () {
                                    _controller.previousPage(
                                        duration: _kDuration, curve: _kCurve);
                                  },
                                ),
                                FlatButton(
                                  child: Icon(Icons.navigate_next),
                                  onPressed: () {
                                    _controller.nextPage(duration: _kDuration, curve: _kCurve);
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                new Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 15.0,
                    child: Container(
                        color: Colors.white,
                        child:  Column(
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
                    )
                ),
              ],

            ),
          )
      );
    }  else if((MediaQuery.of(context).size.width < 650)){
      return Scaffold(
          appBar: commonTopBar(width,height,appbarTitle, widget.subscriber,context),
          body: Container(
            //padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    itemCount: widget.mapData.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map mapFunction = widget.mapData.values.elementAt(index);
                      return Column(
                        children: [
                          //toolbar(theme),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          SizedBox(height: 18,),
                          //Title
                          //  Text(mapFunction["title"], style: theme.textTheme.headline5.copyWith(color: theme.accentColor)),
                          Text('CHANGE RINGTONE', style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),   ),
                          SizedBox(height: 18,),
                          Container(
                            //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                            alignment:Alignment.bottomCenter,
                            height:3.0,
                            width:width,
                            color:CustomColours.lightGrey,
                          ),
                          //Steps
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //height: MediaQuery.of(context).size.height - 100,
                            height: MediaQuery.of(context).size.height/1.5,
                            child: PageView.builder(
                              controller: _controller,
                              itemCount: mapFunction["contents"].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      //Body
                                      Column(
                                        children: [
                                          Padding(padding: EdgeInsets.all(12)),
                                          //Step
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${changeStep(index)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            alignment:Alignment.centerLeft,
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Text(
                                              '${indexPosition(index,mapFunction)}',
                                              style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.grayDark),
                                            ),
                                          ),
                                          //Image
                                          Padding(
                                            padding: const EdgeInsets.all(32),
                                            child: Image.network(
                                              mapFunction["contents"][index]["image"],
                                              height: MediaQuery.of(context).size.height/1.6 * 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          //Swipe text
                          Container(
                            color: CustomColours.lightGrey,
                            child: Row(
                             // mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(Icons.navigate_before),
                                  onPressed: () {
                                    _controller.previousPage(
                                        duration: _kDuration, curve: _kCurve);
                                  },
                                ),
                                FlatButton(
                                  child: Icon(Icons.navigate_next),
                                  onPressed: () {
                                    _controller.nextPage(duration: _kDuration, curve: _kCurve);
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                new Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 15.0,
                    child: Container(
                        color: Colors.white,
                        child:  Column(
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
                    )
                ),
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
            child:  Text('Guide',style: theme.textTheme.bodyText2.copyWith(color: CustomColours.grayDark),),
          ),

          Container(),

        ],
      ),

    );
  }
 String indexPosition(int index,Map mapFunction) {
    print('imggggss ${ mapFunction.toString()}');
    if (index==1) {
      return "Select Sounds & Haptics";
    }else{
      print('immmmm ${mapFunction["contents"][index]["image"]}');
      return   mapFunction["contents"][index]["step"];
    }
  }

  String changeStep(int index) {
    if (index==1) {
      return 'Step 2';
    }  else{
      return 'Step 1';
    }
  }
   vievPager(){
   return  Column(
       children: <Widget>[
         PageView.builder(
           controller: _controller,
           itemCount: _samplePages.length,
           itemBuilder: (BuildContext context, int index) {
             return _samplePages[index % _samplePages.length];
           },
         ),
         Container(
           color: Colors.lightBlueAccent,
           child: Row(
             mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               FlatButton(
                 child: Text('Prev'),
                 onPressed: () {
                   _controller.previousPage(
                       duration: _kDuration, curve: _kCurve);
                 },
               ),
               FlatButton(
                 child: Text('Next'),
                 onPressed: () {
                   _controller.nextPage(duration: _kDuration, curve: _kCurve);
                 },
               )
             ],
           ),
         )
       ],
     );
   }

  viewPage() {
    return IntroductionScreen(
      pages: lstPages,
      onDone: () {
        //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
      },
      onSkip: () {
        //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebHome(widget.subscriber)));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AccountScreen(widget.subscriber)));
      },
      showSkipButton: false,
      skip: Text("Skip",style: TextStyle(color: Colors.transparent,fontSize: 16),),
      next: const Icon(Icons.navigate_next,size: 50,),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.transparent,fontSize: 16)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(6.0),
          activeSize: const Size(6.0, 3.0),
          activeColor: Theme.of(context).accentColor,
          color: Colors.transparent,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
    );
  }
}

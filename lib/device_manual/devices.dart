import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';

import 'applications.dart';
import 'device_manuals.dart';

class Devices extends StatefulWidget {
  String companyName;
  final Subscriber subscriber;
  Devices(this.subscriber,this.companyName);

  @override
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  double width, height;
  String appbarTitle = 'Device Manuals';
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
                  margin: EdgeInsets.only(top: 30),
                  child:  SingleChildScrollView(
                    child:  Column(
                      children: [
                        // toolbar(theme),
                        Container(
                          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                        //Title
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text("CHOOSE YOUR DEVICE", style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),),
                        ),
                        Container(
                          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                        StreamBuilder<DocumentSnapshot>(
                          stream: Firestore.instance.collection("Device Manual").document(widget.companyName).get().asStream(),
                          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());

                            if (snapshot.connectionState == ConnectionState.none) return Center(child: Text("No Connection!"));

                            Map mapData = snapshot.data.data;
                            List lstDevices = mapData["Collection"];

                            return Container(
                              height: MediaQuery.of(context).size.height - 150,
                              child: ListView.builder(
                                  itemCount: lstDevices.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(lstDevices[index],style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),),
                                      onTap: () {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => Applications(widget.subscriber,widget.companyName, lstDevices[index])));
                                      },
                                    );
                                  }),
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
          body:Container(
            padding: EdgeInsets.only(left: width/12,right: width/12),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child:  SingleChildScrollView(
                    child:  Column(
                      children: [
                        // toolbar(theme),
                        Container(
                          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                        //Title
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text("CHOOSE YOUR DEVICE", style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),),
                        ),
                        Container(
                          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                        StreamBuilder<DocumentSnapshot>(
                          stream: Firestore.instance.collection("Device Manual").document(widget.companyName).get().asStream(),
                          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());

                            if (snapshot.connectionState == ConnectionState.none) return Center(child: Text("No Connection!"));

                            Map mapData = snapshot.data.data;
                            List lstDevices = mapData["Collection"];

                            return Container(
                              height: MediaQuery.of(context).size.height - 150,
                              child: ListView.builder(
                                  itemCount: lstDevices.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(lstDevices[index],style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),),
                                      onTap: () {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => Applications(widget.subscriber,widget.companyName, lstDevices[index])));
                                      },
                                    );
                                  }),
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
          body:Container(
           // padding: EdgeInsets.only(left: width/6,right: width/6),
            child: Stack(
              children: [

                Container(
                  margin: EdgeInsets.only(top: 30),
                  child:  SingleChildScrollView(
                    child:  Column(
                      children: [
                        // toolbar(theme),
                        Container(
                          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                        //Title
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text("CHOOSE YOUR DEVICE", style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.samidarkRed,fontFamily: 'Montserrat',),),
                        ),
                        Container(
                          //margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 3),
                          alignment:Alignment.bottomCenter,
                          height:3.0,
                          width:width,
                          color:CustomColours.lightGrey,
                        ),
                        StreamBuilder<DocumentSnapshot>(
                          stream: Firestore.instance.collection("Device Manual").document(widget.companyName).get().asStream(),
                          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());

                            if (snapshot.connectionState == ConnectionState.none) return Center(child: Text("No Connection!"));

                            Map mapData = snapshot.data.data;
                            List lstDevices = mapData["Collection"];

                            return Container(
                              height: MediaQuery.of(context).size.height - 150,
                              child: ListView.builder(
                                  itemCount: lstDevices.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(lstDevices[index],style: theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold,color: CustomColours.darkBlue),),
                                      onTap: () {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => Applications(widget.subscriber,widget.companyName, lstDevices[index])));
                                      },
                                    );
                                  }),
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
            child:  Text('Device Menuals',style: theme.textTheme.bodyText2.copyWith(color: CustomColours.grayDark),),
          ),

          Container(),

        ],
      ),

    );
  }
}

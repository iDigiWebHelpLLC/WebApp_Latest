import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywebflutterapp/models/subscriber.dart';
import 'package:mywebflutterapp/styles/colors.dart';
import 'package:mywebflutterapp/utils/commontopbar.dart';

class WebHome extends StatefulWidget {
  final Subscriber subscriber;
  WebHome(this.subscriber);
  @override
  _WebHomeState createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  double width, height;
  bool isTabulateWidth,isMobileWidth,isDesktopWidth;
  String isPageName;
  String appbarTitle = 'Billing';
 // String appbarTitle = 'Account Overview';
  bool tap1,tap2,tap3,tap4;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    isTabulateWidth =   (MediaQuery.of(context).size.width < 800);
    isMobileWidth =   (MediaQuery.of(context).size.width < 600);
    isDesktopWidth =   (MediaQuery.of(context).size.width < 1000);
    height = MediaQuery.of(context).size.height;
    var screenSize = MediaQuery.of(context).size;
    tap1  =true;
    tap2  =false;
    tap3  =false;
    tap4  =false;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height/5),
            child: Container(
                color: Colors.white,
                child: Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.asset("assets/images/Patriot_Logo_Web APP.png",),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        appbarTitle = 'Billing';
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(subscriber)));
                                      },
                                      child:Row(
                                        children: [
                                          tap1?Image.asset("assets/images/billingiconblue.png",):
                                          Image.asset("assets/images/Billing Icon_Gray.png",),
                                          Text(
                                            'Billing',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      )
                                  ),
                                  SizedBox(width: width / 30),
                                  InkWell(
                                      onTap: () {
                                        appbarTitle = 'Welcome';
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PlansScreen(subscriber)));
                                      },
                                      child:Row(
                                        children: [
                                          tap2?Image.asset("assets/images/Support Icon_Blue.png",):
                                          Image.asset("assets/images/Support Icon_Gray.png",),
                                          Text(
                                            'Welcome',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      )
                                  ),
                                  SizedBox(width: width / 30),
                                  InkWell(
                                      onTap: () {
                                        appbarTitle ='Migration';
                                      },
                                      child:Row(
                                        children: [
                                          tap3?Image.asset("assets/images/Migration Icon_Blue.png",):
                                          Image.asset("assets/images/Migration Icon_Gray.png",),
                                          Text(
                                            'Migration',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      )
                                  ),
                                  SizedBox(width: width / 30),
                                  InkWell(
                                      onTap: () {},
                                      child:Row(
                                        children: [
                                          tap4?Image.asset("assets/images/Account Icon_Blue.png",):
                                          Image.asset("assets/images/Account Icon_Gray.png",),

                                          Text(
                                            'Account Overview',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Container(width: 25,height: 25,)
                          ],
                        ),
                      ),
                      Container(
                        color: CustomColours.lightGrey,
                        width: width,
                        padding: EdgeInsets.only(top:15,bottom: 15),
                        child:  Text(
                          '${appbarTitle??''}',
                          style: TextStyle(color: CustomColours.appred),textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
            )
      ),
      body: Center(child: Text(''),)
    );
  }
}
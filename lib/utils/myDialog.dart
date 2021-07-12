import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:toast/toast.dart';
/*showToast(String msg, BuildContext context){
  Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
}*/


/*void showAlert(BuildContext context, String title,)
{

  showDialog(
      context: context,
      builder: (BuildContext context)
      {
        //return new CupertinoAlertDialog(
        return new AlertDialog(
          title: new Text(title,style: TextStyle(fontFamily: 'Myriad Pro'),),
          // content: new Text("Alert content"),
          actions: [
            CupertinoDialogAction(
                isDefaultAction: true,
                child: new Text("Ok",style: TextStyle(fontFamily: 'Myriad Pro'),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
  );
}*/

 showMyDialog(BuildContext context, String message)  {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        //title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(message,textAlign: TextAlign.center,),
              )

             // Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[

          TextButton(
              child:Text('Ok',textAlign: TextAlign.center,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class MyDialog {
  const MyDialog({
    Key key,
    this.title,
    this.message,
    this.okButton,
    this.calcelButton,
    @required this.typeDialog,
    @required this.context,
    this.callback,
    this.isGoBack = false,
    this.barrierDismissible = false,
    this.radius,
  });

  final int typeDialog;
  final String title,message;
  final Widget okButton,calcelButton;
  final VoidCallback callback;
  final BuildContext context;
  final bool isGoBack;
  final bool barrierDismissible;
  final int radius;


 /* showToast(String msg, BuildContext context){
    Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
  }*/

    show()
  {
   return _getWidget(typeDialog, context);
  }

  _getWidget(int a,BuildContext context)
  {
    switch(a) {
      case 0:
        return showMyDialog(context);
      case 1:
        return showPress();
      case 2:
        return showCallbackAlert();
    }
  }

  showMyDialog(BuildContext contexts)  {
    return showDialog(
      context: contexts,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(title,textAlign: TextAlign.center,),
                )

                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[

            TextButton(
              child:Text('Ok',textAlign: TextAlign.center,),
              onPressed: () {
                Navigator.of(contexts).pop();
                //Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

 /* void showAlert()
  {

    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return new CupertinoAlertDialog(
            title: new Text(title,style: TextStyle(fontFamily: 'Myriad Pro'),),
            // content: new Text("Alert content"),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: new Text("Ok",style: TextStyle(fontFamily: 'Myriad Pro'),),
                  onPressed: callback == null ? () {
                    Navigator.pop(context);
                    if(isGoBack)
                      Navigator.of(context).pop();

                  } : callback
              ),
            ],
          );
        }
    );
  }
*/
  void showPress()
  {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context)
        {

          return CupertinoAlertDialog(
            content: Padding(
              padding: EdgeInsets.fromLTRB(0.0,10.0,0.0,0.0),
              child: CupertinoActivityIndicator(
                radius: radius == null ? 20 : radius,
                //animating: true,
              ),
            ),

            title: new Text(title,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Myriad Pro'),),
            /*   actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: new Text("Ok"),
                  onPressed: callback == null ? () {
                    Navigator.pop(context);
                    if(isGoBack)
                      Navigator.of(context).pop();

                  } : callback
              ),
            ],*/
          );
        }
    );

  }

  void showCallbackAlert()
  {
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return new CupertinoAlertDialog(
            title: new Text(title,style: TextStyle(fontFamily: 'Myriad Pro'),),
            // content: new Text("Alert content"),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: new Text("Cancel",style: TextStyle(fontFamily: 'Myriad Pro'),),
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  }
              ),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: new Text("Ok",style: TextStyle(fontFamily: 'Myriad Pro'),),
                  onPressed: callback
              ),
            ],
          );
        }
    );
  }

}
import 'package:mywebflutterapp/models/subscriber.dart';

class Subscribers {
  List<Subscriber> subscribers = new List();
  Map meta;

  Subscribers.fromJson(Map data) {
    List listSub = data["subscribers"];
    listSub.forEach((sub) => subscribers.add(Subscriber.fromJson(sub)));

    meta = data["meta"];
  }
}

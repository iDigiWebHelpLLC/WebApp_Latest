import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mywebflutterapp/models/get_all_billing_statements_id_entity.dart';
import 'package:mywebflutterapp/models/get_products_model_entity.dart';
import 'package:mywebflutterapp/models/get_service_usage_summary_data_entity.dart';
import 'package:mywebflutterapp/models/line_detail.dart';
import 'package:mywebflutterapp/models/line_recurring_plans_entity.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/models/subscriber_detail.dart';
import 'package:mywebflutterapp/models/subscriber_statement.dart';
import 'package:mywebflutterapp/models/subscribers.dart';

class APIClient {
  Future<Subscribers> getSubDetails() async {
    http.Response response;
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };

    //response = await http.get("https://patriotqa-atom-api.bequickapps.com/subscribers", headers: headers);
    Uri myUri = Uri.parse("https://patriot-atom-api.bequickapps.com/subscribers");
      response = await http.get(myUri, headers: headers);
    Subscribers subscribers;

    print('subb ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      //successfully loaded
      subscribers = Subscribers.fromJson(jsonDecode(response.body));
      return subscribers;
    } else {
      //error
      return null;
    }
  }

  //Gets the details for the subscriber
  Future<SubscriberDetail> getSingleSubDetail(String id) async {
    print('singleSubID ${id}');
    http.Response response;

    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };

    Uri myUri = Uri.parse("https://patriot-atom-api.bequickapps.com/subscribers/$id");
    //response = await http.get("https://patriotqa-atom-api.bequickapps.com/subscribers/$id", headers: headers);
    response = await http.get(myUri, headers: headers);
    SubscriberDetail subscriberDetail;
    print('singleSubResponse ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      SubscriberDetail subscriberDetail = SubscriberDetail.fromJson(jsonDecode(response.body));

      return subscriberDetail;
    } else {
      //error
      return null;
    }
  }
//Gets the details for the subscriber
  Future<Subscribers> getloginDetail(String email,String pass) async {
    //print('singleSubID ${id}');
    http.Response response;
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };

    //response = await http.get("https://patriotqa-atom-api.bequickapps.com/subscribers/$id", headers: headers);
    response = await http.get("https://patriot-atom-api.bequickapps.com/subscribers?filter_by[0][column]=email&filter_by[0][operator]=eq&filter_by[0][value]=${email}&filter_by[1][column]=account_pin&filter_by[1][operator]=in&filter_by[1][value]=${pass}", headers: headers);
    print('loginSubResponse ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      Subscribers subscribersModel = Subscribers.fromJson(jsonDecode(response.body));

      return subscribersModel;
    } else {
      //error
      return null;
    }
  }

  //Gets the Billing statement from the "current_billing_statement_id" field from the subscriber API
  Future<BillingStatements> getBillingStatement(String billingStatementId) async {
    print('callbilling_statementsApiWith :  ${billingStatementId}');
    http.Response response;

    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };
    Uri myUri = Uri.parse("https://patriot-atom-api.bequickapps.com/billing_statements/$billingStatementId");
    response = await http.get(
      myUri,
      headers: headers,
    );
    print('billing_statements :  ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      BillingStatements billingStatements = BillingStatements.fromJson(jsonDecode(response.body));

      return billingStatements;
    } else {
      //error
      return null;
    }
  }
  //Gets the Billing statement from the "current_billing_statement_id" field from the subscriber API
  Future<BillingStatements> getBillingStatementBySubId(String billingStatementId, String subscriberId) async {
    http.Response response;

    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };

    Uri myUri = Uri.parse("https://patriot-atom-api.bequickapps.com/billing_statements?by_subscriber_id=$subscriberId");
    response = await http.get(
      myUri,
     // "https://patriotqa-atom-api.bequickapps.com/billing_statements?by_subscriber_id=$subscriberId",
      headers: headers,
    );

    if (response.statusCode == 200) {
      //successfully loaded
      BillingStatements billingStatements = BillingStatements.fromJson(jsonDecode(response.body));

      return billingStatements;
    } else {
      //error
      return null;
    }
  }


  //Gets the details of all the lines for this subscriber
  Future<LinesDetailEntity> getLinesDetail(String id) async {
    print('lineDataID :-  ${id}');
    http.Response response;
   // id = '1050052';
    Map<String, String> headers = {
      'content-type': 'application/json',
      // 'X-AUTH-TOKEN': '230202e3-c6eb-43d6-b9ac-3cfe00ba5f6a',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };

    response = await http.get("https://patriot-atom-api.bequickapps.com/lines?status=active&by_subscriber_id=" + id, headers: headers);
    //response = await http.get("https://patriotqa-atom-api.bequickapps.com/lines?status=active&by_subscriber_id=" + id, headers: headers);

    LinesDetailEntity linesDetail;

    if (response.statusCode == 200) {
      //successfully loaded
      print('statusCode :-  ${response.statusCode}');
      linesDetail = LinesDetailEntity().fromJson(jsonDecode(response.body));

      print('responseLine :-  ${response.body}');
      return linesDetail;
    } else {
      //error
      return null;
    }
  }
  //Gets the all Line data by line id
  Future<LineDetail> getLineDetail(String id) async {
    http.Response response;
    print('lineID:- ${id}');
    //   id = '5487';
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };

    response = await http.get("https://patriot-atom-api.bequickapps.com/buckets?by_line_id=" + id, headers: headers);
    LineDetail lineDetail;
    print('lineresponse:- ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      lineDetail = LineDetail.fromJson(jsonDecode(response.body));
      return lineDetail;
    } else {
      return null;
    }
  }

  //Gets the all Line data by currentBillingStatementID and  line id
  Future<LineDetail> getLineDetailbyBothID(String currentBillingStatementId,String id) async {
    http.Response response;
    print('currentBillingStatementIdssInLineDetails:- ${currentBillingStatementId}');
    print('lineIDInplanHistory:- ${id}');
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };
    response = await http.get("https://patriot-atom-api.bequickapps.com/buckets?by_billing_statement_id=" + currentBillingStatementId+"&by_line_id="+ id, headers: headers);
    LineDetail lineDetail;
    print('botIDhlineresponse:- ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      lineDetail = LineDetail.fromJson(jsonDecode(response.body));
      return lineDetail;
    } else {
      //error
      return null;
    }
  }

  //call lineRecurringPlans api using  ny_line_id  for get Find the current plan id
  Future<LineRecurringPlansEntity> getLineRecurringPlans(String line_id, String subsId) async {
    http.Response response;
    //String id = '1050052';

    print('lineReccuringPlans Line id:- ${line_id}');
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };
    response = await http.get("https://patriot-atom-api.bequickapps.com/line_recurring_plans?by_line_id=" + line_id +"status=active&by_subscriber_id=" + subsId, headers: headers);
    LineRecurringPlansEntity lineRecurringPlans;
    print('lineReccuringPlansResponse:- ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      lineRecurringPlans = LineRecurringPlansEntity().fromJson(jsonDecode(response.body));
      return lineRecurringPlans;
    } else {
      //error
      return null;
    }
  }
  //get products by new productID
  Future<GetProductsModelEntity> getCurrentProductBy(String productID) async {
    http.Response response;
    print('getCurrentProductByproductID:- ${productID}');
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };
    response = await http.get("https://patriot-atom-api.bequickapps.com/products/$productID", headers: headers);
    GetProductsModelEntity getProductsModel;
    print('lineReccuringPlansResponse:- ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      getProductsModel = GetProductsModelEntity().fromJson(jsonDecode(response.body));
      return getProductsModel;
    } else {
      //error
      return null;
    }
  }

  //get aingle Line data in migrations
  Future<LinesDetailEntity> getSingleLineData(String lineID) async {
    http.Response response;
    print('getSingleLineId:- ${lineID}');
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };
    response = await http.get("https://patriot-atom-api.bequickapps.com/lines/$lineID", headers: headers);
    LinesDetailEntity linesDetailEntity;
    print('Dingle Line detail Data:- ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      linesDetailEntity = LinesDetailEntity().fromJson(jsonDecode(response.body));
      return linesDetailEntity;
    } else {
      //error
      return null;
    }
  }
  //call change charrier
  Future<http.Response> ChangeCarrierPostApi( var postChangeCarrier,String lineID ) async {
    http.Response response;
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };
    /*76350*/
    //  var bodyValue = conversationReq.toJson();
    //    print('finalBoddy:- ${bodyValue}');
    response = await http.post("https://patriot-atom-api.bequickapps.com/lines/${lineID}/change_carrier?",
        body:   json.encode(
            postChangeCarrier
          /* {
            "new_carrier_id": "${5}",
            "device_serial": "${355676111260376}",
            "iccid": "${8901240160109082639}",
            "product_mapping": [
              {"old_product_id": "${647}",
                "new_product_id": "${680}"
              }
            ]
          }*/
        ),
        headers: headers);
    GetProductsModelEntity getProductsModel;
    print('ChangeCarrierResponse:- ${response.body}');
    return response;
  }

  //call UpdateComplete Transition
  Future<String> updateCompletTransitionPutApi(var updateTransition ,String lineID) async {
    http.Response response;
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };
    /*76350*/
    response = await http.put("https://patriot-atom-api.bequickapps.com/lines/$lineID?",
        body:   json.encode(
            updateTransition
        ),
        headers: headers);
    GetProductsModelEntity getProductsModel;
    print('updateTransitionResponse:- ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      var successResponse =  jsonDecode(response.body);
      //var successResponse =  "${response.statusCode}";
      return successResponse;
    } else {
      print('response.statusCode:- ${response.statusCode}');
      return null;
    }
  }

  //get all billingstatementId's
  Future<GetAllBillingStatementsIdEntity> getAllBillingstatements(String subscriberId) async {
    http.Response response;

    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };
    // response = await http.get("https://patriot-atom-api.bequickapps.com/billing_statements", headers: headers);
    response = await http.get("https://patriot-atom-api.bequickapps.com/billing_statements?filter_by[0][column]=subscriber_id&filter_by[0][operator]=eq&filter_by[0][value]=${subscriberId}&filter_by[1][column]=state&filter_by[1][operator]=eq&filter_by[1][value]=posted", headers: headers);
    GetAllBillingStatementsIdEntity billingStatementsIdEntity;
    print('getAllBillingStatements:- ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      //billingStatementsIdEntity = GetAllBillingStatementsIdEntity().fromJson(jsonDecode(response.body));
      billingStatementsIdEntity = GetAllBillingStatementsIdEntity().fromJson(jsonDecode(response.body));
      return billingStatementsIdEntity;
    } else {
      //error
      return null;
    }
  }



//get usage summary of history
  Future<GetServiceUsageSummaryDataEntity> getHistoryUsageSummary(String billsmtId) async {
    http.Response response;
    print('billsmtId:- ${billsmtId}');
    Map<String, String> headers = {
      'content-type': 'application/json',
      'X-AUTH-TOKEN': '40c97ff5-6913-49eb-91c2-8886f1bd7f1b',
      'DISABLE_PUSHER': 'true'
    };
    response = await http.get("https://patriot-atom-api.bequickapps.com/billing_statements/${billsmtId}/usage_summary", headers: headers);
    GetServiceUsageSummaryDataEntity serviceUsageSummaryDataEntity;
    print('Dingle Line detail Data:- ${response.body}');
    if (response.statusCode == 200) {
      //successfully loaded
      serviceUsageSummaryDataEntity = GetServiceUsageSummaryDataEntity().fromJson(jsonDecode(response.body));
      return serviceUsageSummaryDataEntity;
    } else {
      //error
      return null;
    }
  }
}

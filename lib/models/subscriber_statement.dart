class BillingStatements {
  List<BillingStatement> billingStatements;

  BillingStatements.fromJson(Map<String, dynamic> json) {
    if (json['billing_statements'] != null) {
      billingStatements = List<BillingStatement>();
      json['billing_statements'].forEach((v) {
        billingStatements.add(BillingStatement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.billingStatements != null) {
      data['billing_statements'] = this.billingStatements.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BillingStatement {
  int id;
  int subscriberId;
  String state;
  int servicePeriodId;
  String createdAt;
  String updatedAt;
  String closedAt;
  String startAt;
  String dueAt;
  String postedAt;
  String statementAttachmentFileName;
  String balance;
  String netReceived;
  bool paid;
  bool pastDue;
  String statementAttachmentUrl;
  String status;
  String subtotal;
  String taxTotal;
  String total;

  BillingStatement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscriberId = json['subscriber_id'];
    state = json['state'];
    servicePeriodId = json['service_period_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    closedAt = json['closed_at'];
    startAt = json['start_at'];
    dueAt = json['due_at'];
    postedAt = json['posted_at'];
    statementAttachmentFileName = json['statement_attachment_file_name'];
    balance = json['balance'];
    netReceived = json['net_received'];
    paid = json['paid'];
    pastDue = json['past_due'];
    statementAttachmentUrl = json['statement_attachment_url'];
    status = json['status'];
    subtotal = json['subtotal'];
    taxTotal = json['tax_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subscriber_id'] = this.subscriberId;
    data['state'] = this.state;
    data['service_period_id'] = this.servicePeriodId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['closed_at'] = this.closedAt;
    data['start_at'] = this.startAt;
    data['due_at'] = this.dueAt;
    data['posted_at'] = this.postedAt;
    data['statement_attachment_file_name'] = this.statementAttachmentFileName;
    data['balance'] = this.balance;
    data['net_received'] = this.netReceived;
    data['paid'] = this.paid;
    data['past_due'] = this.pastDue;
    data['statement_attachment_url'] = this.statementAttachmentUrl;
    data['status'] = this.status;
    data['subtotal'] = this.subtotal;
    data['tax_total'] = this.taxTotal;
    data['total'] = this.total;
    return data;
  }
}

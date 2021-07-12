class LineDetail {
  List<Buckets> buckets;

  LineDetail.fromJson(Map<String, dynamic> json) {
    if (json['buckets'] != null) {
      buckets = new List<Buckets>();
      json['buckets'].forEach((v) {
        buckets.add(new Buckets.fromJson(v));
      });
    }
  }
}

class Buckets {
  int id;
  List<int> carrierServiceIds;
  String createdAt;
  String endedAt;
  Plan plan;
  List<Services> services;
  String startAt;
  String state;
  bool unlimited;
  bool addOn;
  String currentBalance;
  String endAt;
  bool overflow;
  String startingBalance;

  Buckets(
      {this.id,
        this.carrierServiceIds,
        this.createdAt,
        this.endedAt,
        this.plan,
        this.services,
        this.startAt,
        this.state,
        this.unlimited,
        this.addOn,
        this.currentBalance,
        this.endAt,
        this.overflow,
        this.startingBalance});

  Buckets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carrierServiceIds = json['carrier_service_ids'].cast<int>();
    createdAt = json['created_at'];
    endedAt = json['ended_at'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    if (json['services'] != null) {
      services = new List<Services>();
      json['services'].forEach((v) {
        services.add(new Services.fromJson(v));
      });
    }
    startAt = json['start_at'];
    state = json['state'];
    unlimited = json['unlimited'];
    addOn = json['add_on'];
    currentBalance = json['current_balance'];
    endAt = json['end_at'];
    overflow = json['overflow'];
    startingBalance = json['starting_balance'];
  }

}

class Plan {
  int id;
  String name;

  Plan({this.id, this.name});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Services {
  String service;
  var remainingUnits;
  String usedUnits;
  var totalUnits;
  String usedCredit;
  int calculatedUsedUnits;

  Services(
      {this.service,
        this.remainingUnits,
        this.usedUnits,
        this.totalUnits,
        this.usedCredit,
        this.calculatedUsedUnits});

  Services.fromJson(Map<String, dynamic> json) {
    service = json['service'];
    remainingUnits = json['remaining_units'];
    usedUnits = json['used_units'];
    totalUnits = json['total_units'];
    usedCredit = json['used_credit'];
    calculatedUsedUnits = json['calculated_used_units'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service'] = this.service;
    data['remaining_units'] = this.remainingUnits;
    data['used_units'] = this.usedUnits;
    data['total_units'] = this.totalUnits;
    data['used_credit'] = this.usedCredit;
    data['calculated_used_units'] = this.calculatedUsedUnits;
    return data;
  }
}

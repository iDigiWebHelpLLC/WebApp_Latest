class Subscriber {
  int id;
  double currentBalance, totalBalance;
  String email, accountPin, firstName, lastName;

  Subscriber.fromJson(Map data) {
    id = data["id"] ?? "";
    currentBalance = double.tryParse(data["current_balance"]) ?? 0.0;
    totalBalance = double.tryParse(data["total_balance"]) ?? 0.0;
    email = data["email"] ?? "";
    accountPin = data["account_pin"] ?? "";
    firstName = data["first_name"] ?? "";
    lastName = data["last_name"] ?? "";
  }
}

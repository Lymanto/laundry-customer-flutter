class BankModel {
  late String name;
  late String number;

  BankModel({
    required this.name,
    required this.number,
  });

  BankModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
    };
  }
}

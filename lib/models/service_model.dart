class ServiceModel {
  late String serviceName;
  late int price;
  late int estimate;

  ServiceModel({
    required this.serviceName,
    required this.price,
    required this.estimate,
  });

  ServiceModel.fromJson(Map<String, dynamic> json) {
    serviceName = json['service_name'];
    price = json['price_per_kg'];
    estimate = json['estimate'];
  }
  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'price': price,
      'estimate': estimate,
    };
  }
}

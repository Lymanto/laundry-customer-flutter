class AddressModel {
  late String addressDetails;
  // late double longitude;
  // late double latitude;

  AddressModel({
    required this.addressDetails,
    // required this.longitude,
    // required this.latitude,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressDetails = json['address_details'];
    // longitude = json['longitude'];
    // latitude = json['latitude'];
  }
  Map<String, dynamic> toJson() {
    return {
      'address_details': addressDetails,
      // 'longitude': longitude,
      // 'latitude': latitude,
    };
  }
}

import 'package:customer/models/address_model.dart';
import 'package:customer/models/bank_model.dart';
import 'package:customer/models/operational_model.dart';
import 'package:customer/models/service_model.dart';

class StoreModel {
  late String id;
  late String name;
  late String description;
  late OperationalModel operational;
  late AddressModel address;
  late List<ServiceModel> service;
  late BankModel bank;
  late String storePhoto;

  StoreModel({
    required this.id,
    required this.name,
    required this.description,
    required this.operational,
    required this.address,
    required this.service,
    required this.bank,
    required this.storePhoto,
  });

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id_store'];
    name = json['store_name'];
    description = json['description'];
    storePhoto = json['store_photo'];
    operational = OperationalModel.fromJson(json['operational']);
    address = AddressModel.fromJson(json['address']);
    service = json['service']
        .map<ServiceModel>((e) => ServiceModel.fromJson(e))
        .toList();
    bank = BankModel.fromJson(json['account']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'operational': operational.toJson(),
      'address': address.toJson(),
      'service': service.map((e) => e.toJson()).toList(),
      'bank': bank.toJson(),
      'storePhoto': storePhoto,
    };
  }
}

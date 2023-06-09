import 'package:customer/models/detail_transaksi.dart';
import 'package:customer/models/store_model.dart';

class HistoryModel {
  late String id;
  late StoreModel storeModel;
  late String paymentMethod;
  late DetailTransaksi detailTransaksi;
  late DateTime pickUp;
  late List<String> status;

  HistoryModel({
    required this.id,
    required this.storeModel,
    required this.paymentMethod,
    required this.detailTransaksi,
    required this.pickUp,
    required this.status,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id_transaction'];
    storeModel = StoreModel.fromJson(json['id_store']);
    paymentMethod = json['payment_method'];
    detailTransaksi = DetailTransaksi.fromJson(json['details']);
    pickUp = DateTime.parse(json['pick_up']);
    status = json['status'].cast<String>();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_store': storeModel.toJson(),
      'payment_method': paymentMethod,
      'details': detailTransaksi.toJson(),
      'pick_up': pickUp.toString(),
      'status': status,
    };
  }
}

import 'package:customer/models/store_model.dart';
import 'package:customer/services/store_service.dart';
import 'package:flutter/material.dart';

class StoreProvider with ChangeNotifier {
  List<StoreModel> _store = [];
  List<StoreModel> get store => _store;
  set store(List<StoreModel> store) {
    _store = store;
    notifyListeners();
  }

  Future<void> getStore(
    String token,
  ) async {
    try {
      List<StoreModel> stores = await StoreService().getStore(token);
      _store = stores;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getStoreByService(
    String token,
    String serviceName,
  ) async {
    try {
      List<StoreModel> stores =
          await StoreService().getStoreByService(token, serviceName);
      _store = stores;
    } catch (e) {
      print(e);
    }
  }
}

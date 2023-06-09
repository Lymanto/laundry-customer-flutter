import 'package:customer/models/promo_model.dart';
import 'package:customer/services/promo_service.dart';
import 'package:flutter/material.dart';

class PromoProvider with ChangeNotifier {
  List<PromoModel> _promo = [];
  List<PromoModel> get promo => _promo;
  set promo(List<PromoModel> promo) {
    _promo = promo;
    notifyListeners();
  }

  Future<void> getPromo(
    String token,
  ) async {
    try {
      List<PromoModel> promos = await PromoService().getPromo(token);
      _promo = promos;
    } catch (e) {
      print(e);
    }
  }
}

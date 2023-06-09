import 'package:customer/services/checkout_service.dart';
import 'package:flutter/material.dart';

class CheckoutProvider with ChangeNotifier {
  Future<bool> checkout(
    String? paymentMethod,
    String pickUp,
    String idStore,
    String idUser,
    int grandTotal,
    int weight,
    int subtotal,
    String token,
    int discountedPieces,
  ) async {
    try {
      if (await CheckoutService().checkout(
          paymentMethod: paymentMethod,
          pickUp: pickUp,
          idStore: idStore,
          idUser: idUser,
          grandTotal: grandTotal,
          weight: weight,
          subtotal: subtotal,
          token: token,
          discountedPieces: discountedPieces)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}

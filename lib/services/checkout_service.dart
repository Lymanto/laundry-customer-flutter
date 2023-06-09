import 'dart:convert';

import 'package:http/http.dart' as http;

class CheckoutService {
  String baseUrl = 'http://localhost:3000/api/v1';

  Future checkout({
    required String? paymentMethod,
    required String pickUp,
    required String idStore,
    required String idUser,
    required int grandTotal,
    required int weight,
    required int subtotal,
    required String token,
    required int discountedPieces,
  }) async {
    var url = '$baseUrl/basic/transaction/addTransaction';
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var body = jsonEncode({
      "payment_method": paymentMethod,
      "service_name": 'biasa',
      "weight": weight,
      "subtotal": subtotal,
      "shipping_fee": 3000,
      "discounted_shipping_fee": 0,
      "discounted_pieces": discountedPieces,
      "grandtotal": grandTotal,
      "pick_up": pickUp,
      "status": "dipesan",
      "id_store": idStore,
      "id_user": idUser,
    });
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal checkout');
    }
  }
}

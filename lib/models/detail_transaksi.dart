class DetailTransaksi {
  late int weight;
  late int grandTotal;
  late int subtotal;

  late int shippingFee;
  late int discountShippingFee;
  late int discountPiece;
  DetailTransaksi({
    required this.weight,
    required this.grandTotal,
    required this.subtotal,
    required this.shippingFee,
    required this.discountShippingFee,
    required this.discountPiece,
  });

  DetailTransaksi.fromJson(Map<String, dynamic> json) {
    weight = json['weight'];
    grandTotal = json['grandtotal'];
    subtotal = json['subtotal'];
    shippingFee = json['shipping_fee'];
    discountShippingFee = json['discounted_shipping_fee'];
    discountPiece = json['discounted_pieces'];
  }
  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'grandtotal': grandTotal,
      'subtotal': subtotal,
      'shipping_fee': shippingFee,
      'discounted_shipping_fee': discountShippingFee,
      'discounted_pieces': discountPiece,
    };
  }
}

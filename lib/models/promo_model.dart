class PromoModel {
  late String idPromo;
  late String promoCode;
  late String promoName;
  late int numberOfPieces;
  late int maxPieces;
  late int availableQuota;
  late String description;
  late String idStore;

  PromoModel({
    required this.idPromo,
    required this.promoCode,
    required this.promoName,
    required this.numberOfPieces,
    required this.maxPieces,
    required this.availableQuota,
    required this.description,
    required this.idStore,
  });

  PromoModel.fromJson(Map<String, dynamic> json) {
    idPromo = json['id_promo'];
    promoCode = json['promo_code'];
    promoName = json['promo_name'];
    numberOfPieces = json['number_of_pieces'];
    maxPieces = json['max_pieces'];
    availableQuota = json['available_quota'];
    description = json['description'];
    idStore = json['id_store'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id_promo': idPromo,
      'promo_code': promoCode,
      'promo_name': promoName,
      'number_of_pieces': numberOfPieces,
      'max_pieces': maxPieces,
      'available_quota': availableQuota,
      'description': description,
      'id_store': idStore,
    };
  }
}

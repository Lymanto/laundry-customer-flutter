class OperationalModel {
  late String open;
  late String close;

  OperationalModel({
    required this.open,
    required this.close,
  });

  OperationalModel.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    close = json['close'];
  }
  Map<String, dynamic> toJson() {
    return {
      'open': open,
      'close': close,
    };
  }
}

import 'package:customer/models/history_model.dart';
import 'package:customer/services/history_service.dart';
import 'package:flutter/material.dart';

class HistoryProvider with ChangeNotifier {
  List<HistoryModel> _history = [];
  List<HistoryModel> get history => _history;
  set history(List<HistoryModel> history) {
    _history = history;
    notifyListeners();
  }

  Future<void> getHistoryById(
    String token,
    String idUser,
  ) async {
    try {
      List<HistoryModel> histories =
          await HistoryService().getHistoryById(token, idUser);
      _history = histories;
    } catch (e) {
      print(e);
    }
  }
}

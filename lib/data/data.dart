import 'package:flutter/material.dart';

class Data with ChangeNotifier {
  List _saleInfoList = [];
  List get getSaleInfoList => _saleInfoList;

  List _keywordList = [];
  List get getKeywordList => _keywordList;

  void setSaleInfoList(Iterable<dynamic> items) {
    _saleInfoList.clear();
    _saleInfoList.addAll(items);
    notifyListeners();
  }

  void addSaleInfoList(dynamic item) {
    _saleInfoList.add(item);
    notifyListeners();
  }

  void addAllSaleInfoList(Iterable<dynamic> items) {
    _saleInfoList.addAll(items);
    notifyListeners();
  }

  void setKeywordList(Iterable<dynamic> items) {
    _keywordList.clear();
    _keywordList.addAll(items);
    notifyListeners();
  }

  void addKeywordList(dynamic item) {
    _keywordList.add(item);
    notifyListeners();
  }

  void addAllKeywordList(Iterable<dynamic> items) {
    _keywordList.addAll(items);
    notifyListeners();
  }

  void removeKeywordList(dynamic item) {
    _keywordList.remove(item);
    notifyListeners();
  }
}

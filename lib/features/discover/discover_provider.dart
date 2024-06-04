import 'package:flutter/cupertino.dart';

class DiscoverProvider extends ChangeNotifier {
  String _selectedCat = "All";
  get selectedCat => _selectedCat;
  void selectACategory(cat) {
    _selectedCat = cat;
    notifyListeners();
  }

  String _selectedRate = "All";
  get selectedRate => _selectedRate;
  void selectARating(cat) {
    _selectedRate = cat;
    notifyListeners();
  }
}

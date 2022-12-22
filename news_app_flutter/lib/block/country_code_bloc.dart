import 'dart:async';

import 'package:news_app_flutter/utils.dart';

class SelectCountryBloc {
  final StreamController countryController = StreamController.broadcast();

  String defaultCountry = countries[0];

  Stream get countryStream => countryController.stream;

  void selectCountry(String country) {
    countryController.sink.add(country);
  }

  dispose() {
    countryController.close();
  }
}

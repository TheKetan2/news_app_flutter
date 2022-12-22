import 'dart:async';

import 'package:news_app_flutter/utils.dart';

class SelectCategoryBloc {
  final StreamController categoryController = StreamController.broadcast();

  String defaultCategory = categories[0];

  Stream get categoryStream => categoryController.stream;

  void selectCategory(String category) {
    categoryController.sink.add(category);
  }

  dispose() {
    categoryController.close();
  }
}

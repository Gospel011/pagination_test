import 'package:flutter/material.dart';

extension ScrollControllerExtensions on ScrollController {
  /// When reverse is set to true, [callback] is called when the user scrolls
  /// to the top of the page.
  void paginate({required void Function() callback, bool reverse = false}) {
    addListener(() {
      final maxScrollExtent = position.maxScrollExtent;
      if (position.atEdge) {
        if (position.pixels == maxScrollExtent) {
          print("Bottom");

          if (!reverse) callback();
        } else {
          print("top");

          if (reverse) callback();
        }
      }
    });
  }
}

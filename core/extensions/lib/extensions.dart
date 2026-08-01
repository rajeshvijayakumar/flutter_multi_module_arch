import 'package:extensions/constants/constant.dart';

extension NonNullstring on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!; // 100% its not null so we used !
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!; // 100% its not null so we used !
    }
  }
}
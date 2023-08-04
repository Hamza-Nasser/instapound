import 'package:flutter/foundation.dart' show kDebugMode;

extension StringEx on String {
  /// Returns a new string in which all leading and trailing occurrences of a set of specified characters from the current string are removed.
  // String trim([String chars = ' ']) {
  //   return trimLeft(chars).trimRight(chars);
  // }

  /// Returns a new string in which all leading occurrences of a set of specified characters from the current string are removed.
  String trimLeft([String chars = ' ']) {
    if (isEmpty) return this;
    final pattern = RegExp('^[$chars]+');
    return replaceFirst(pattern, '');
  }

  /// Returns a new string in which all trailing occurrences of a set of specified characters from the current string are removed.
  String trimRight([String chars = ' ']) {
    if (isEmpty) return this;
    final pattern = RegExp('[$chars]+\$');
    return replaceFirst(pattern, '');
  }

  /// Returns a new string in which all leading and trailing occurrences of a set of specified characters from the current string are removed.
  String trimAll([String chars = ' ']) {
    if (isEmpty) return this;
    final pattern = RegExp('[$chars]+');
    return replaceAll(pattern, '');
  }

  /// Returns a new string in which all leading occurrences of a set of specified characters from the current string are removed.
  String trimLeftAll([String chars = ' ']) {
    if (isEmpty) return this;
    final pattern = RegExp('^[$chars]+');
    return replaceAll(pattern, '');
  }

  /// Returns a new string in which all trailing occurrences of a set of specified characters from the current string are removed.
  String trimRightAll([String chars = ' ']) {
    if (isEmpty) return this;
    final pattern = RegExp('[$chars]+\$');
    return replaceAll(pattern, '');
  }

  /// Returns a new string in which all leading and trailing occurrences of a set of specified characters from the current string are removed.
  String trimEx([String chars = ' ']) {
    if (isEmpty) return this;
    final pattern = RegExp('[$chars]+');
    return replaceAll(pattern, '');
  }

  /// Returns a new string in which all leading occurrences of a set of specified characters from the current string are removed.
  String trimLeftEx([String chars = ' ']) {
    if (isEmpty) return this;
    final pattern = RegExp('^[$chars]+');
    return replaceAll(pattern, '');
  }
}


extension IfDebugging on String {
  String? get ifDebugging => kDebugMode ? this : null;
}
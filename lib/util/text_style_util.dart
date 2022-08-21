import 'package:flutter/material.dart';

class TextStyleUtil {
  static TextStyle bigHead() =>
      const TextStyle(color: Colors.black54, fontSize: 40);

  static TextStyle head1() => const TextStyle(
        color: Colors.black54,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle head2() => const TextStyle(
        color: Colors.black54,
        fontSize: 24,
      );

  static TextStyle description() => const TextStyle(
        color: Colors.black54,
        fontSize: 18,
        height: 1.5,
      );

  static TextStyle warning() => TextStyle(
        color: Colors.red[800],
        fontSize: 18,
        height: 1.5,
      );
}

import 'package:flutter/material.dart';

abstract class AppBorders {
  static const k4BorderRadius = BorderRadius.all(Radius.circular(4));
  static const k8BorderRadius = BorderRadius.all(Radius.circular(8));
  static const k9BorderRadius = BorderRadius.all(Radius.circular(9));
  static const k15BorderRadius = BorderRadius.all(Radius.circular(15));
  static const k24BorderRadius = BorderRadius.all(Radius.circular(24));
  static const k30BorderRadius = BorderRadius.all(Radius.circular(30));

  static const k30TopBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  );

  static const k10TopBorderRectangle = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
  );
}

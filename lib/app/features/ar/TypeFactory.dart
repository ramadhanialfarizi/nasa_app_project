import 'package:flutter/material.dart';
import 'package:nasa_project/app/features/ar/annotation.dart';

Widget typeFactory(AnnotationType type) {
  IconData iconData = Icons.ac_unit_outlined;
  Color color = Colors.teal;
  switch (type) {
    case AnnotationType.good:
      iconData = Icons.local_pharmacy_outlined;
      color = Colors.red;
      break;
    case AnnotationType.bad:
      iconData = Icons.hotel_outlined;
      color = Colors.green;
      break;
    default:
      iconData = Icons.local_pharmacy_outlined;
      color = Colors.red;
  }
  return Icon(
    iconData,
    size: 40,
    color: color,
  );
}

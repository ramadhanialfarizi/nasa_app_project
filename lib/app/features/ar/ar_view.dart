import 'package:ar_location_view/ar_annotation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_project/app/features/ar/components/ParametersCard.dart';

class ArView extends StatelessWidget {
  final ArAnnotation? annotation;
  const ArView({
    super.key,
    this.annotation,
  });

  @override
  Widget build(BuildContext context) {
    return ParametersCard(annotation: annotation);
  }
}

import 'package:ar_location_view/ar_annotation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_project/app/features/ar/components/ParametersCard.dart';
import 'package:nasa_project/app/repository/data_model/soil_dm.dart';

class ArView extends StatelessWidget {
  final ArAnnotation? annotation;
  final SoilDM? soilDM;
  const ArView({super.key, this.annotation, this.soilDM});

  @override
  Widget build(BuildContext context) {
    return ParametersCard(annotation: annotation, soilDM: soilDM);
  }
}

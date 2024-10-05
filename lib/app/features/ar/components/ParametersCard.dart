import 'package:flutter/material.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/features/ar/components/ParameterRow.dart';

enum ParametersCardType { good, bad }

class ParametersCard extends StatelessWidget {
  final ParametersCardType type;
  const ParametersCard({
    this.type = ParametersCardType.good,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(offset: Offset(0, 5), blurRadius: 5, color: Colors.grey)
        ],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Expanded(
        flex: 2,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bandung, Indonesia",
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "19°C",
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  ParameterRow(
                      name: "Soil",
                      result: "Good",
                      type: ParametersCardType.good),
                  ParameterRow(
                      name: "Water",
                      result: "Good",
                      type: ParametersCardType.good),
                  ParameterRow(
                      name: "Fertilizer",
                      result: "Good",
                      type: ParametersCardType.good),
                  // Text(
                  //   '${"annotation.distanceFromUser.toInt()"} m',
                  // ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  color: (type == ParametersCardType.good
                          ? ColorUtils.greenColors
                          : ColorUtils.redColors)
                      .withOpacity(0.23)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommendation",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Soil & Weather condition is good for growing your plant",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

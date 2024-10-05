import 'package:ar_location_view/ar_annotation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/core/utils/image_utils.dart';
import 'package:nasa_project/app/features/ar/ar_card_detail.dart';
import 'package:nasa_project/app/features/ar/components/ParameterRow.dart';

class ParametersCard extends StatelessWidget {
  final ParametersCardType type;
  final ArAnnotation? annotation;

  const ParametersCard({
    this.type = ParametersCardType.good,
    super.key,
    this.annotation,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const ArCardDetail());
      },
      child: Container(
        height: 198,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(offset: Offset(0, 5), blurRadius: 5, color: Colors.grey)
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(annotation?.position.longitude ?? "")}, ${annotation?.position.latitude ?? ""}",
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Text(
                        "19°C",
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  ParameterRow(
                      name: "Soil",
                      result: (type.name.capitalizeFirst ?? "").toString(),
                      type: type),
                  // const ParameterRow(
                  //     name: "Water",
                  //     result: "Good",
                  //     type: ParametersCardType.good),
                  // const ParameterRow(
                  //     name: "Fertilizer",
                  //     result: "Good",
                  //     type: ParametersCardType.good),
                  // Text(
                  //   '${annotation?.distanceFromUser.toPrecision(2)} m',
                  // ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  color: (type == ParametersCardType.good
                          ? ColorUtils.greenColors
                          : ColorUtils.redColors)
                      .withOpacity(0.23)),
              child: Row(
                children: [
                  SizedBox(
                    width: 175,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Recommendation",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          type == ParametersCardType.good
                              ? "Soil & Weather condition is good for growing your plant"
                              : "Soil & Weather condition is poor Please wait until June for better time",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.asset(type == ParametersCardType.good
                      ? ImageUtils.lightbulbIcon
                      : ImageUtils.clockIcon)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ParametersCardType { good, bad }

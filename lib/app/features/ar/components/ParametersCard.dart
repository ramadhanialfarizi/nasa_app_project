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
        height: 340,
        width: 339,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(offset: Offset(0, 5), blurRadius: 5, color: Colors.grey)
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black),
                      ),
                      const Text(
                        "19°C",
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ParameterRow(
                              name: "Soil",
                              result:
                                  (type.name.capitalizeFirst ?? "").toString(),
                              type: type),
                          ParameterRow(
                              name: "Soil",
                              result:
                                  (type.name.capitalizeFirst ?? "").toString(),
                              type: type),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ParameterRow(
                              name: "Soil",
                              result:
                                  (type.name.capitalizeFirst ?? "").toString(),
                              type: type),
                          ParameterRow(
                              name: "Soil",
                              result:
                                  (type.name.capitalizeFirst ?? "").toString(),
                              type: type),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ParameterRow(
                              name: "Soil",
                              result:
                                  (type.name.capitalizeFirst ?? "").toString(),
                              type: type),
                          ParameterRow(
                              name: "Soil",
                              result:
                                  (type.name.capitalizeFirst ?? "").toString(),
                              type: type),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ParameterRow(
                              name: "Soil",
                              result:
                                  (type.name.capitalizeFirst ?? "").toString(),
                              type: type),
                          ParameterRow(
                              name: "Soil",
                              result:
                                  (type.name.capitalizeFirst ?? "").toString(),
                              type: type),
                        ],
                      ),
                    ],
                  ),
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
                          : type == ParametersCardType.medium
                              ? ColorUtils.yellowColors
                              : ColorUtils.redColors)
                      .withOpacity(0.23)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 5),
                        width: 245,
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
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                                text: const TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text:
                                        "Recommendation plant to grow in your soil is ",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                TextSpan(
                                    text: "Tomato",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700))
                              ],
                            )),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Transform.rotate(
                            angle: 0.5,
                            child: Image.asset(
                              ImageUtils.tomatoIcon,
                              height: 52,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 270,
                    child: Text(
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      "Tap to see more",
                      textAlign: TextAlign.end,
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

enum ParametersCardType { good, bad, medium }

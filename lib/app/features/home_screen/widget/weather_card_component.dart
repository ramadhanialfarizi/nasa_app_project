import 'package:flutter/material.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/core/utils/image_utils.dart';

class WeatherCardComponent extends StatelessWidget {
  const WeatherCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(right: 20, left: 20),
      decoration: BoxDecoration(
          color: ColorUtils.secondaryColors,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '19 C',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Pondok Petir, Depok',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                ImageUtils.sunnydayIcon,
                width: 100,
                height: 67,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Soil Moisture',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: ColorUtils.whiteColors),
                      child: Text(
                        'Good',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: ColorUtils.greenColors),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'EV',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: ColorUtils.whiteColors),
                      child: Text(
                        'Bad',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: ColorUtils.redColors),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Precipitation',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: ColorUtils.whiteColors),
                      child: Text(
                        'Good',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: ColorUtils.greenColors),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

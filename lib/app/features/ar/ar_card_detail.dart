import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:nasa_project/app/core/global_widget/market_card.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/core/utils/image_utils.dart';

class ArCardDetail extends StatelessWidget {
  const ArCardDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 196,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: ColorUtils.secondaryColors,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    color: ColorUtils.blurColors.withOpacity(0.2))
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommended Plant to Grow',
                  style: TextStyle(fontSize: 24, color: ColorUtils.whiteColors),
                ),
                Row(
                  children: [
                    const Text(
                      "Rp 10.000/kg",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                    ),
                    Text(
                      "+0.13%",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.5)),
                    )
                  ],
                ),
                const Text(
                  'Tomatoes - fresh or chilled',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  'IDR / Carton Box (11.3398kg = 25lbs), Aug 09, 2024',
                  style: TextStyle(
                      color: ColorUtils.whiteColors,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Plant List',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          const MarketCard(
            imagePath: ImageUtils.tomatoIcon,
            price: "10000",
            percentage: "0.13",
            status: "+",
            name: "Tomato",
          )
        ],
      ),
    ));
  }
}

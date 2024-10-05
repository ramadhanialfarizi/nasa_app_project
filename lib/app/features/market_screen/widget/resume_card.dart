import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:nasa_project/app/core/helpers/helpers.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/core/utils/image_utils.dart';

class ResumeCard extends StatelessWidget {
  final String? price;
  final String? percentage;
  final String? status;
  const ResumeCard({super.key, this.price, this.percentage, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConstantUtils.getFullWidth(context) * 0.7,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorUtils.tersierGreenColors,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            ImageUtils.roundedIcon,
            width: 52,
            height: 52,
          ),
          const SizedBox(
            width: 13,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rp ${Helpers().convertNumberToPrice(int.parse(price ?? "0"))}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$status$percentage%',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Helpers().getPercentageColors(status ?? ""),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

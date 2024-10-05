import 'package:flutter/material.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/features/ar/components/ParametersCard.dart';

class ParameterRow extends StatelessWidget {
  final String name;
  final String result;
  final ParametersCardType type;
  const ParameterRow({
    super.key,
    this.name = "",
    this.result = "",
    this.type = ParametersCardType.good,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Text(
            result,
            maxLines: 1,
            style: TextStyle(
                color: ColorUtils.greenColors,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}

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
          SizedBox(
            width: 87,
            child: Text(
              name,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          SizedBox(
            width: 55,
            child: Text(
              result,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: type == ParametersCardType.good
                      ? ColorUtils.greenColors
                      : type == ParametersCardType.medium
                          ? ColorUtils.yellowColors
                          : ColorUtils.redColors,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

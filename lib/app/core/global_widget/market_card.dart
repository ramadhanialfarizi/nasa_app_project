import 'package:flutter/material.dart';
import 'package:nasa_project/app/core/helpers/helpers.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';

class MarketCard extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? price;
  final String? firstPrice;
  final String? lastPrice;
  final String? percentage;
  final String? status;
  final bool? useRangePrice;
  final VoidCallback? onPressed;
  const MarketCard({
    super.key,
    this.imagePath,
    this.name,
    this.price,
    this.percentage,
    this.status,
    this.onPressed,
    this.useRangePrice = false,
    this.firstPrice,
    this.lastPrice,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(
          20,
        ),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: ColorUtils.whiteColors,
          borderRadius: BorderRadius.circular(
            8,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorUtils.blurColors.withOpacity(0.15),
              spreadRadius: 00,
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath ?? '',
              width: 35,
              height: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (useRangePrice ?? false) ...[
                    Text(
                      "Rp ${Helpers().convertNumberToPrice(int.parse(firstPrice ?? "0"))}-${Helpers().convertNumberToPrice(int.parse(lastPrice ?? "0"))}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ] else ...[
                    Text(
                      "Rp ${Helpers().convertNumberToPrice(int.parse(price ?? "0"))}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

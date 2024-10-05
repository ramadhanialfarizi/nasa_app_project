import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Padding(
        padding: EdgeInsets.only(
          top: ConstantUtils.getFullHeight(context) * 0.1,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ConstantUtils.getFullWidth(context),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorUtils.secondaryColors,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Actual Market Price',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.whiteColors,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp 10.000/kg',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: ColorUtils.whiteColors,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '28 August 2024',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                      color: ColorUtils.whiteColors,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Vegetable List',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}

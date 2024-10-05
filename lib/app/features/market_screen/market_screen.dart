import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/global_widget/market_card.dart';
import 'package:nasa_project/app/core/helpers/helpers.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/features/market_screen/controller/market_screen_controller.dart';
import 'package:nasa_project/app/repository/market_repository/response/plant_list_response.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MarketScreenController());
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
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 50,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorUtils.secondaryGreenColors,
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
                  Obx(
                    () => Text(
                      'Rp ${Helpers().convertNumberToPrice(int.parse(controller.marketResponseData.value.actualPrice ?? "0"))}/kg',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: ColorUtils.whiteColors,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(
                    () => Text(
                      '${Helpers().formattedDate(controller.marketResponseData.value.date ?? "08-12-2024")}',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 10,
                        color: ColorUtils.whiteColors,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Vegetable List',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => (controller.marketResponseData.value.plantList ?? [])
                        .isEmpty
                    ? const SizedBox()
                    : ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemCount: controller
                            .marketResponseData.value.plantList?.length,
                        itemBuilder: (context, index) {
                          var data = controller
                              .marketResponseData.value.plantList?[index];
                          return MarketCard(
                            imagePath: data?.image,
                            name: data?.name,
                            price: data?.price,
                            percentage: data?.increasePrecentage,
                            status: data?.status,
                            onPressed: () {
                              controller
                                  .gotoDetail(data ?? PlantListResponse());
                            },
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/global_widget/market_card.dart';
import 'package:nasa_project/app/core/helpers/helpers.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/features/market_screen/controller/market_detail_screen_controller.dart';
import 'package:nasa_project/app/features/market_screen/widget/resume_card.dart';
import 'package:nasa_project/app/repository/market_repository/response/plant_list_response.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MarketDetailScreen extends StatelessWidget {
  final PlantListResponse plantListResponse;
  const MarketDetailScreen({
    super.key,
    required this.plantListResponse,
  });

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(MarketDetailScreenController(
      plantListResponse: plantListResponse,
    ));
    return BaseWidgetContainer(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: ConstantUtils.getFullHeight(context) * 0.1,
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    _controller.onBackTap();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  plantListResponse.image ?? "",
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  plantListResponse.name ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: ConstantUtils.getFullHeight(context) * 0.17,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorUtils.whiteColors,
                    borderRadius: BorderRadius.circular(
                      51,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            ColorUtils.chartSecondaryColors.withOpacity(0.11),
                        spreadRadius: 0,
                        blurRadius: 100.0,
                        offset: const Offset(-20, 40),
                      ),
                      BoxShadow(
                        color: ColorUtils.chartColors.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 100.0,
                        offset: const Offset(-15, 40),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chart Data',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => SfCartesianChart(
                          palette: [ColorUtils.chartColors],
                          primaryXAxis: const DateTimeAxis(),
                          series: <CartesianSeries>[
                            LineSeries<Map, DateTime>(
                                dataSource: _controller.marketResponseData.value
                                    .chartDataList![0].chartData!
                                    .map((element) => {
                                          'value':
                                              int.parse(element.value ?? ""),
                                          'dateTime': Helpers()
                                              .convertToDateTime(
                                                  element.timeMarker ??
                                                      "08-12-2023")
                                        })
                                    .toList(),
                                xValueMapper: (sales, _) =>
                                    sales['dateTime'] as DateTime,
                                yValueMapper: (sales, _) => sales['value'])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => MarketCard(
                    name: _controller.marketResponseData.value.name,
                    imagePath: _controller.marketResponseData.value.image,
                    percentage: _controller.marketResponseData.value.percentage,
                    useRangePrice: true,
                    firstPrice: _controller.marketResponseData.value.lowerPrice,
                    lastPrice: _controller.marketResponseData.value.higherPrice,
                    status: _controller.marketResponseData.value.status,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Obx(
                  () => ResumeCard(
                    percentage: _controller.marketResponseData.value.percentage,
                    price: _controller.marketResponseData.value.higherPrice,
                    status: _controller.marketResponseData.value.status,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

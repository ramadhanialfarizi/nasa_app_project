import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/features/market_screen/controller/market_detail_screen_controller.dart';
import 'package:nasa_project/app/repository/market_repository/response/plant_list_response.dart';

class MarketDetailScreen extends StatelessWidget {
  final PlantListResponse plantListResponse;
  const MarketDetailScreen({
    super.key,
    required this.plantListResponse,
  });

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(MarketDetailScreenController());
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
          )
        ],
      ),
    );
  }
}

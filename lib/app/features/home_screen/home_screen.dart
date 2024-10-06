import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/core/utils/image_utils.dart';
import 'package:nasa_project/app/features/ar/components/ParametersCard.dart';
import 'package:nasa_project/app/features/home_screen/controller/home_screen_controller.dart';
import 'package:nasa_project/app/features/home_screen/widget/weather_card_component.dart';
import 'package:nasa_project/app/features/login_screen/login_screen.dart';

class ColumnParameter extends StatelessWidget {
  final String? name;
  final String? description;
  final ParametersCardType? type;
  const ColumnParameter({
    super.key,
    this.name = "",
    this.description = "",
    this.type = ParametersCardType.good,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name ?? ""),
        Text(description ?? "",
            style: TextStyle(
              color: type == ParametersCardType.good
                  ? ColorUtils.greenColors
                  : type == ParametersCardType.medium
                      ? ColorUtils.yellowColors
                      : ColorUtils.redColors,
            )),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeScreenController());
    return BaseWidgetContainer(
      onPopInvoked: (p0) {
        Get.off(() => const LoginScreen());
      },
      canPop: false,
      body: Padding(
        padding: EdgeInsets.only(
            // left: 20,
            // right: 20,
            top: ConstantUtils.getFullHeight(context) * 0.1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 33,
                        width: 33,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                ImageUtils.userIcons,
                              ),
                              fit: BoxFit.fill),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 19,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome Back,',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '\nDarlene Robertson',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'It’s a Sunny day !',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ExpandableCarousel(
              options: ExpandableCarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
                enlargeFactor: 10,
                showIndicator: true,
                slideIndicator: CircularSlideIndicator(),
              ),
              items: const [
                WeatherCardComponent(),
                WeatherCardComponent(),
                WeatherCardComponent(),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: ColorUtils.historyCardColors,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Other Location',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Bandung, Indonesia"),
                          Image.asset(
                            ImageUtils.rainIcon,
                            width: 55,
                            height: 30,
                          ),
                          const Text("19 C")
                        ],
                      ),
                      const Row(
                        children: [
                          ColumnParameter(
                            name: "Soil",
                            description: "Hygrosphobic",
                            type: ParametersCardType.good,
                          ),
                          ColumnParameter(
                            name: "Water",
                            description: "Low",
                            type: ParametersCardType.bad,
                          ),
                          ColumnParameter(
                            name: "Fertilizer",
                            description: "Sub Humid",
                            type: ParametersCardType.medium,
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

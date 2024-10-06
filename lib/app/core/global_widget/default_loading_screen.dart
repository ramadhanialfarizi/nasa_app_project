import 'package:flutter/widgets.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';

class DefaultLoadingScreenProject extends StatelessWidget {
  const DefaultLoadingScreenProject({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreenLoading(
      indicatorColor: ColorUtils.primaryColors,
    );
  }
}

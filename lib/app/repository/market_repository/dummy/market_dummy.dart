import 'package:nasa_project/app/core/utils/image_utils.dart';

class MarketDummy {
  static const dummy = {
    "statusCode": "200",
    "isError": false,
    "message": "SUCCESS",
    "data": {
      "actualPrice": "10000",
      "date": "08-12-2024",
      "plantList": [
        {
          "image": ImageUtils.tomatoIcon,
          "name": "Tomato",
          "price": "10000",
          "status": "+",
          "increasePrecentage": "0.1"
        },
        {
          "image": ImageUtils.cucumberIcon,
          "name": "Cucumber",
          "price": "10000",
          "status": "+",
          "increasePrecentage": "0.1"
        },
        {
          "image": ImageUtils.pepperBellIcon,
          "name": "Pepper Bell",
          "price": "10000",
          "status": "+",
          "increasePrecentage": "0.1"
        },
        {
          "image": ImageUtils.eggplantIcon,
          "name": "Eggplant",
          "price": "10000",
          "status": "-",
          "increasePrecentage": "0.20"
        },
      ]
    }
  };
}

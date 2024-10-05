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

  static const detailDummy = {
    "statusCode": "200",
    "isError": false,
    "message": "SUCCESS",
    "data": {
      "image": ImageUtils.tomatoIcon,
      "name": "Cucumber",
      "lowerPrice": "18000",
      "higherPrice": "24000",
      "percentage": "0.20",
      "status": "+",
      "chartDataList": [
        {
          "timePeriod": "1M",
          "highest": "18649.94",
          "lowest": "16349.14",
          "average": "17545.82",
          "chartData": [
            {"timeMarker": "2023-01-01", "value": "1785367"},
            {"timeMarker": "2023-02-01", "value": "1764256"},
            {"timeMarker": "2023-03-01", "value": "1759023"},
            {"timeMarker": "2023-04-01", "value": "1778456"},
            {"timeMarker": "2023-05-01", "value": "1785912"},
            {"timeMarker": "2023-06-01", "value": "1782167"},
            {"timeMarker": "2023-07-01", "value": "1764312"},
            {"timeMarker": "2023-08-01", "value": "1756934"},
            {"timeMarker": "2023-09-01", "value": "1769217"},
            {"timeMarker": "2023-10-01", "value": "1775472"},
            {"timeMarker": "2023-11-01", "value": "1778698"},
            {"timeMarker": "2023-12-01", "value": "1852594"}
          ]
        },
      ]
    }
  };
}

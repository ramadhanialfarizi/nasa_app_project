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
      "currencyCode": "GBP",
      "buyPrice": "18596,82",
      "sellPrice": "18235,09",
      "buyPriceBankNote": "14600.82",
      "sellPriceBankNote": "12089.04",
      "chartDataList": [
        {
          "timePeriod": "1D",
          "highest": "17092.63",
          "lowest": "16912.23",
          "average": "16998.45",
          "chartData": [
            {"timeMarker": "2024-01-17 00:00", "value": "16925.92"},
            {"timeMarker": "2024-01-17 01:00", "value": "17012.76"},
            {"timeMarker": "2024-01-17 02:00", "value": "16984.21"},
            {"timeMarker": "2024-01-17 03:00", "value": "16948.97"},
            {"timeMarker": "2024-01-17 04:00", "value": "16993.12"},
            {"timeMarker": "2024-01-17 05:00", "value": "17021.67"},
            {"timeMarker": "2024-01-17 06:00", "value": "17059.12"},
            {"timeMarker": "2024-01-17 07:00", "value": "17073.28"},
            {"timeMarker": "2024-01-17 08:00", "value": "17092.63"},
            {"timeMarker": "2024-01-17 09:00", "value": "17047.23"},
            {"timeMarker": "2024-01-17 10:00", "value": "16998.45"},
            {"timeMarker": "2024-01-17 11:00", "value": "16934.79"},
            {"timeMarker": "2024-01-17 12:00", "value": "16912.23"},
            {"timeMarker": "2024-01-17 13:00", "value": "16959.57"},
            {"timeMarker": "2024-01-17 14:00", "value": "16923.12"},
            {"timeMarker": "2024-01-17 15:00", "value": "16934.79"},
            {"timeMarker": "2024-01-17 16:00", "value": "16989.93"},
            {"timeMarker": "2024-01-17 17:00", "value": "17012.76"},
            {"timeMarker": "2024-01-17 18:00", "value": "17045.01"},
            {"timeMarker": "2024-01-17 19:00", "value": "17063.36"},
            {"timeMarker": "2024-01-17 20:00", "value": "17086.19"},
            {"timeMarker": "2024-01-17 21:00", "value": "17063.36"},
            {"timeMarker": "2024-01-17 22:00", "value": "17073.28"},
            {"timeMarker": "2024-01-17 23:00", "value": "16875.67"}
          ]
        },
        {
          "timePeriod": "1W",
          "highest": "19346.63",
          "lowest": "16623.12",
          "average": "17942.78",
          "chartData": [
            {"timeMarker": "2024-01-13", "value": "18289.67"},
            {"timeMarker": "2024-01-14", "value": "18382.21"},
            {"timeMarker": "2024-01-15", "value": "18194.62"},
            {"timeMarker": "2024-01-16", "value": "18020.94"},
            {"timeMarker": "2024-01-17", "value": "17956.78"},
            {"timeMarker": "2024-01-18", "value": "17569.34"},
            {"timeMarker": "2024-01-19", "value": "17349.92"}
          ]
        },
        {
          "timePeriod": "1M",
          "highest": "19134.07",
          "lowest": "16348.56",
          "average": "17825.44",
          "chartData": [
            {"timeMarker": "2024-01-01", "value": "17105.46"},
            {"timeMarker": "2024-01-08", "value": "18479.16"},
            {"timeMarker": "2024-01-15", "value": "17987.29"},
            {"timeMarker": "2024-01-22", "value": "17648.72"}
          ]
        },
        {
          "timePeriod": "3M",
          "highest": "19582.41",
          "lowest": "16743.89",
          "average": "17912.57",
          "chartData": [
            {"timeMarker": "2024-01-01", "value": "18751.58"},
            {"timeMarker": "2024-02-01", "value": "17404.62"},
            {"timeMarker": "2024-03-01", "value": "18353.18"}
          ]
        },
        {
          "timePeriod": "1Y",
          "highest": "18649.94",
          "lowest": "16349.14",
          "average": "17545.82",
          "chartData": [
            {"timeMarker": "2023-01-01", "value": "17853.67"},
            {"timeMarker": "2023-02-01", "value": "17642.56"},
            {"timeMarker": "2023-03-01", "value": "17590.23"},
            {"timeMarker": "2023-04-01", "value": "17784.56"},
            {"timeMarker": "2023-05-01", "value": "17859.12"},
            {"timeMarker": "2023-06-01", "value": "17821.67"},
            {"timeMarker": "2023-07-01", "value": "17643.12"},
            {"timeMarker": "2023-08-01", "value": "17569.34"},
            {"timeMarker": "2023-09-01", "value": "17692.17"},
            {"timeMarker": "2023-10-01", "value": "17754.72"},
            {"timeMarker": "2023-11-01", "value": "17786.98"},
            {"timeMarker": "2023-12-01", "value": "18525.94"}
          ]
        },
        {
          "timePeriod": "10Y",
          "highest": "19562,09",
          "lowest": "16484,24",
          "average": "17348,86",
          "chartData": [
            {"timeMarker": "2014-01-01", "value": "18562.09"},
            {"timeMarker": "2015-01-01", "value": "18662.09"},
            {"timeMarker": "2016-01-01", "value": "18348.86"},
            {"timeMarker": "2017-01-01", "value": "18162.09"},
            {"timeMarker": "2018-01-01", "value": "17984.24"},
            {"timeMarker": "2019-01-01", "value": "17862.09"},
            {"timeMarker": "2020-01-01", "value": "17762.09"},
            {"timeMarker": "2021-01-01", "value": "17562.09"},
            {"timeMarker": "2022-01-01", "value": "17462.09"},
            {"timeMarker": "2023-01-01", "value": "19562.09"}
          ]
        }
      ]
    }
  };
}

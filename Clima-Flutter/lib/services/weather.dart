import 'package:clima/services//location.dart';
import 'package:clima/services/networking.dart';

const API_KEY = '21980af80b8a7abf982a44a6dcc06c0a';
const OPEN_WEATHERMAP_URL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    final url = '$OPEN_WEATHERMAP_URL?q=$cityName&appid=$API_KEY&units=metric';
    return _getWeather(url);
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    final int longitude = location.getLongitude().toInt();
    final int latitude = location.getLatitude().toInt();

    final url = '$OPEN_WEATHERMAP_URL?lat=$latitude&lon=$longitude&appid=$API_KEY&units=metric';
    return _getWeather(url);
  }

  Future<dynamic> _getWeather(String url) async {
    // Await the http get response, then decode the json-formatted responce.
    print(url);
    return await NetworkHelper(url: url).getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

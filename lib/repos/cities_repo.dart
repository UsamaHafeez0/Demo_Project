import 'dart:convert';
import 'dart:developer';

import 'package:demo_project/features/cities/models/city.dart';
import 'package:http/http.dart' as http;

class CitiesRepo{

  String citiesAPIURL = 'https://fluttertest.q3logics.com/api/getCities?device_id=aa1b0a9bab56fab2&lang_id=1&country_id=189&token=';

  Future<CityData> getCitiesList({required String token}) async {
    citiesAPIURL += token;

    var url = Uri.parse(citiesAPIURL);
    var response = await http.get(url);

    if(response.statusCode == 200){

      var data = jsonDecode(response.body);
      log('Cities list fetched: $data');
      CityData cities = CityData.fromJson(data);
      return cities;
    }
    else{
      log('Error fetching cities: ${response.body}');
      throw Exception('Error fetching Cities List');
    }
  }

}
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class UserRepo{

  final String _userAPIURL = "https://fluttertest.q3logics.com/api/trial?device_id=123456&token=?&lang_id=1";

  Future<String> fetchToken() async {

    log('Fetching Token');

    var url = Uri.parse(_userAPIURL);
    var response = await http.get(url);

    if(response.statusCode == 200){

      String token = jsonDecode(response.body)['data'];
      log('Token fetched: $token');
      return token;
    }
    else{
      log('Failed fetching token: ${response.body}');
      throw Exception('Error fetching Token');
    }
  }
}
//remote service

import 'package:http/http.dart' as http;
import 'package:shop/models/products.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RemoteServices {
  // using static to take advantage of same client
  static var httpClient = http.Client();
  //make http call
  static Future<List<Welcome>> fetchProduct () async {
    // connect to endpoint rest api get info from this url api
  var resp = await httpClient.get(
      Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline")); // we wait for response => body with status call
    
    if (resp.statusCode == 200) {
        var jsonString = resp.body; // capture the data from endpoint in body
        return welcomeFromJson(jsonString);
    } else {
      // handle error incase of failure
      return [];
    }

    //return [];
  }

}

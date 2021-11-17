import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostModel {
  String url;
  PostModel(this.url);

  Future fetchData() async {
    final finalUrl = Uri.parse(url);
    Response response = await http.get(finalUrl);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

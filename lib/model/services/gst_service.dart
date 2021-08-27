import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gstsampleproject/model/services/base_service.dart';
import '../gst.dart';

class GstService extends BaseService {

  @override
  Future getResponse(String? value) async{
      final response = await http.get(Uri.parse('$baseUrl$value'));

      if (response.statusCode == 200) {
        print(response.body);
        return Gst.fromJson(jsonDecode(response.body)[0]);
      } else {
        throw Exception('Failed to load');
      }
  }

  // Implement Exception handling
  // We only want to handle the get response in the above method.
  // We are going to separate the error handling logic in different function

  @override
  returnResponse(http.Response response) {
    // TODO: implement returnResponse
    throw UnimplementedError();
  }
}
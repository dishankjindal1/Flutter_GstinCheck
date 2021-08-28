import 'package:http/http.dart';

abstract class BaseService {
  final String baseUrl = 'https://611f9dc6988f860017ac4326.mockapi.io/api/gst?gstin=';

  Future<dynamic> getResponse(String? value);
  dynamic returnResponse(Response response); //Error Handling Logic
}
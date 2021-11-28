import 'dart:convert';
import 'dart:io';
import 'package:gstin_check/model/apis/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:gstin_check/model/services/base_service.dart';

class GstService extends BaseService {
  @override
  Future getResponse(String value) async {
    dynamic response = await http.get(Uri.parse('$baseUrl$value'));
    try {
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  dynamic returnResponse(dynamic response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body)[0];
      case 404:
        throw NotFoundException(response.body.toString());
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      case 503:
        throw ServiceUnavailableException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occurred while communication with server with status code ${response.statusCode}");
    }
  }
}

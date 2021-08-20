import 'package:dio/dio.dart';

String mockUrl = 'https://611f9dc6988f860017ac4326.mockapi.io/api/gst';

class GstData {
  final String userId;
  final int gstin;
  final String name;
  final bool status;
  final String address;
  final bool taxtype;
  final bool biztype;
  final String ward;
  final String range;
  final String dor;
  final String cancel;

  GstData(
      {required this.userId,
      required this.gstin,
      required this.name,
      required this.status,
      required this.address,
      required this.taxtype,
      required this.biztype,
      required this.ward,
      required this.range,
      required this.dor,
      required this.cancel});

  factory GstData.fromJson(Map<String, dynamic> json) {
    return GstData(
        userId: json['id'],
        gstin: json['gstin'],
        name: json['name'],
        status: json['status'],
        address: json['address'],
        taxtype: json['taxtype'],
        biztype: json['biztype'],
        ward: json['ward'],
        range: json['range'],
        dor: json['dor'],
        cancel: json['cancel']);
  }
}

Future<GstData> fetchGstData(String data) async {
  var dio = Dio();
  final response = await dio.get('$mockUrl'+'?gstin=$data');

  if (response.statusCode == 200) {
    return GstData.fromJson(response.data[0]);
  } else {
    throw Exception('Failed to load');
  }
}

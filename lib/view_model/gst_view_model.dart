import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gstin_check/model/apis/api_response.dart';
import 'package:gstin_check/model/gst.dart';
import 'package:gstin_check/model/gst_repository.dart';

class GstViewModel extends ChangeNotifier {
  ApiResponse? _apiResponse = ApiResponse.initial("Empty Data");

  ApiResponse? get apiResponse => _apiResponse;

  Gst? _gst;

  Gst? get gst => _gst;

  GstRepository _gstRepository = GstRepository();

  Future<void> getGstDetails(String value) async {
    _apiResponse = ApiResponse.loading("Fetching Detail of Gst $value");
    notifyListeners();
    try {
      _gst = await _gstRepository.fetchGstDetail(value);
      _apiResponse = ApiResponse.completed(_gst);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}

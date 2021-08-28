import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gstsampleproject/model/apis/api_response.dart';
import 'package:gstsampleproject/model/gst.dart';
import 'package:gstsampleproject/model/gst_repository.dart';

class GstViewModel extends ChangeNotifier{
  ApiResponse _apiResponse = ApiResponse.initial("Empty Data");

  ApiResponse? get apiResponse{
    return _apiResponse;
  }

  Gst? _gst;

  Gst? get gst{
    return _gst;
  }

  GstRepository _gstRepository = GstRepository();

  Future<void> getGstDetails(String? value) async {
    _apiResponse = ApiResponse.loading("Fetching Detail of Gst $value");
    notifyListeners();
    try{
      _gst = await _gstRepository.fetchGstDetail(value);
      _apiResponse = ApiResponse.completed(_gst);
    } catch(e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
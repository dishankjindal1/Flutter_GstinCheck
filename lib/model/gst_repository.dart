import 'package:gstsampleproject/model/services/base_service.dart';
import 'package:gstsampleproject/model/services/gst_service.dart';
import 'gst.dart';

class GstRepository {
  BaseService _gstService = GstService();

  Future<Gst> fetchGstDetail(String? value) async {
    dynamic response = await _gstService.getResponse(value);
    return Gst.fromJson(response);
    // List<Gst> gstList = jsonData.map((tagJson) => Gst.fromJson(response)).toList();


    /*

    >>> Implement Local Storage using shared preferences or DB solution
    >> If data is already fetched, we will avoid expense network call and fetch the same data from the DB

     */
  }
}
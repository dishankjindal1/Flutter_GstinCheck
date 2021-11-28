import 'package:gstin_check/model/services/base_service.dart';
import 'package:gstin_check/model/services/db_service.dart';
import 'package:gstin_check/model/services/gst_service.dart';
import 'gst.dart';

class GstRepository {
  BaseService _gstService = GstService();
  DBService _dbService = DBService();

  Future<Gst> fetchGstDetail(String value) async {
    dynamic response;

    if (await _dbService.check(value)) {
      // Check if data is present in Local Storage
      response = await _dbService.getResponse(value);
    } else {
      response = await _gstService
          .getResponse(value); // Retrieve Data from the Network Call
      await _dbService.storeDetails(response); // Store in the Local Storage
    }

    return Gst.fromJson(response); // response is a JsonDecoded Map<K,V>
  }
}

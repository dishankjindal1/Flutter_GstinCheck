import 'package:localstorage/localstorage.dart';
import 'base_service.dart';

class DBService extends BaseService {
  LocalStorage _localStorage = LocalStorage(dbPath);
  dynamic _dataEn;

  @override
  Future getResponse(String? value) async => _dataEn;

  Future check(String value) async {
    if (await getDetails(value))
      return true;
    else
      return false;
  }

  Future storeDetails(dynamic data) async {
    /**
     * toString() method is used because the getDetails() method
     * stores the data key as string but the value is integer
     */
    await _localStorage.setItem(data['gstin'].toString(), data);
  }

  Future getDetails(String value) async {
    _dataEn = await _localStorage.getItem(value);
    return _dataEn != null ? true : false;
  }
}

import 'package:localstorage/localstorage.dart';
import 'base_service.dart';

class DBService extends BaseService {
  LocalStorage _localStorage = LocalStorage(dbPath);
  dynamic _dataEn;

  @override
  Future getResponse(String? value) async => _dataEn;

  Future check(String? value) async {
    if (value != null && await getDetails(value))
      return true;
    else
      return false;
  }

  void storeDetails(dynamic data) {
    /**
     * toString() method is used because the getDetails() method
     * stores the data key as string but the value is integer
     */
    _localStorage.setItem(data['gstin'].toString(), data);
  }

  Future<bool> getDetails(String value) async {
    _dataEn = _localStorage.getItem(value);
    return _dataEn != null ? true : false;
  }
}

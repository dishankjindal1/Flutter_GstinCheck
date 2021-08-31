import 'package:localstorage/localstorage.dart';
import 'base_service.dart';

class DBService extends BaseService {
  LocalStorage _localStorage = LocalStorage(dbPath);
  dynamic _dataEn;

  @override
  Future getResponse(String? value) async => _dataEn;

  Future check(String? value) async {
    print('reached check with $value');
    if (value != null && await getDetails(value))
      return true;
    else
      return false;
  }

  Future storeDetails(dynamic data) async {
    await _localStorage.setItem("${data['gstin']}", data);
  }

  Future<bool> getDetails(String value) async {
    _dataEn = await _localStorage.getItem('$value');

    if (_dataEn == null) return false;

    return true;
  }
}

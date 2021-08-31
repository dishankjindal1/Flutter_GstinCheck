import 'package:localstorage/localstorage.dart';
import 'base_service.dart';

class DBService extends BaseService {
  LocalStorage _localStorage = LocalStorage(dbPath);
  dynamic _dataEn;

  @override
  Future getResponse(String? value) async => _dataEn;

  Future check(String? value) async {
    //await _localStorage.clear();
    print('reached check with $value');
    if (value != null && await getDetails(value))
      return true;
    else
      return false;
  }

  Future storeDetials(dynamic data) async {
    //print('reached storedetails');
    await _localStorage.setItem("${data['gstin']}", data);
  }

  Future<bool> getDetails(String value) async {
    //print('reached getdetails');
    _dataEn = await _localStorage.getItem('$value');
    //print(_dataEn);

    if (_dataEn == null) return false;

    return true;
  }
}

import 'package:test/test.dart';
import 'package:gstsampleproject/view_model/gst_view_model.dart';

void main() {
  test('Api Response on Class initialization must be Empty Data', () {
    GstViewModel _fakeModel = GstViewModel();

    expect(_fakeModel.apiResponse!.message,"Empty Data");
  });
}
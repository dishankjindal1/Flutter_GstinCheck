final String baseUrl = "https://611f9dc6988f860017ac4326.mockapi.io/api/gst?gstin=";
final String dbPath = "gst.json";

abstract class BaseService {
  Future<dynamic> getResponse(String? value);
}
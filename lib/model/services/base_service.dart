final String baseUrl = "https://61a39445d5e83300172920b4.mockapi.io/api/gst?gstin=";
final String dbPath = "gst.json";

abstract class BaseService {
  Future<dynamic> getResponse(String value);
}
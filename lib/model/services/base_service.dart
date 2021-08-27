abstract class BaseService {
  static final String baseUrl = 'https://611f9dc6988f860017ac4326.mockapi.io/api/gst?gstin';

  Future<dynamic> getResponse(string);
}
abstract class BaseApi {
  Future getApiResponse(String url, context);

  Future postApiResponse(String url, dynamic data, context);

  Future deletApiResponse(String url, dynamic data, context);

  // Future postMultipartApiResponse(String url, dynamic data);
}

/*
 * @creater: hc_wen kzh130@163.com
 * @since: 2024-05-12 16:40:14
 * @lastTime: 2024-05-12 20:49:28
 * @LastAuthor: hc_wen kzh130@163.com
 * @Path: \catapp\lib\http\request\base_request.dart
 * @message: headers
 */
enum HttpMethod { GET, POST, DELETE }
//基础请求

abstract class BaseRequest {
  var useHttps = false;

  String authority() {
    return "192.168.188.134:8801";
  }

  HttpMethod httpMethod();
  String path();
  String url() {
    Uri uri;
    var pathStr = path();
    //hhtp和https切换
    //如果没有就不加
    if (useHttps) {
      if (params.isEmpty) {
        uri = Uri.https(authority(), pathStr);
      } else {
        uri = Uri.https(authority(), pathStr, params);
      }
    } else {
      if (params.isEmpty) {
        uri = Uri.http(authority(), pathStr);
      } else {
        uri = Uri.http(authority(), pathStr, params);
      }
    }

    print("url:${uri.toString()}");
    return uri.toString();
  }

  bool needLoding();
  Map<String, String> params = {};
  //添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, String> header = {};
  //添加header
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}

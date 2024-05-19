/*
 * @creater: hc_wen kzh130@163.com
 * @since: 2024-05-12 16:40:44
 * @lastTime: 2024-05-12 20:02:03
 * @LastAuthor: hc_wen kzh130@163.com
 * @Path: \catapp\lib\http\request\test_request.dart
 * @message: headers
 */
import 'package:catapp/http/request/base_request.dart';

class TestRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.GET;
  }

  @override
  bool needLoding() {
    // TODO: implement needLoding
    return false;
  }

  @override
  String path() {
    // TODO: implement path
    return "/api/notify/v1/captcha";
  }
}

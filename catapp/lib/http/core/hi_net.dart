/*
 * @creater: hc_wen kzh130@163.com
 * @since: 2024-05-12 16:39:59
 * @lastTime: 2024-05-12 19:58:26
 * @LastAuthor: hc_wen kzh130@163.com
 * @Path: \catapp\lib\http\core\hi_net.dart
 * @message: headers
 */
import 'package:catapp/http/core/dio_adapter.dart';
import 'package:catapp/http/core/hi_error.dart';
import 'package:catapp/http/core/hi_net_adapter.dart';
import 'package:catapp/http/request/base_request.dart';

class HiNet {
  HiNet._();
  static dynamic _instance;
  static HiNet getInstance() {
    _instance ??= HiNet._();
    return _instance;
  }

  Future fire(BaseRequest request) async {
    HiNetResponse response;
    var error;
    try {
      response = await send(request);
    } on HiNetError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    }
    if (response == null) {
      printLog(error);
    }

    var result = response.data;
    printLog("result:${result}");
    var status = response.statusCode;
    switch (status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw HiNetError(status, result.toString(), data: result);
    }
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    HiNetAdapter adapter = DioAdapter();
    return adapter.send(request);
  }

  void printLog(log) {
    print("hi_net:${log.toString()}");
  }
}

/*
 * @creater: hc_wen kzh130@163.com
 * @since: 2024-05-12 18:57:15
 * @lastTime: 2024-05-12 19:04:44
 * @LastAuthor: hc_wen kzh130@163.com
 * @Path: \catapp\lib\http\core\mock_adapter.dart
 * @message: heade
 */
//测试适配器，mock数据

import 'package:catapp/http/core/hi_net_adapter.dart';
import 'package:catapp/http/request/base_request.dart';

class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    // TODO: implement send
    throw UnimplementedError();
  }
 
}

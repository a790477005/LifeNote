import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_util_code/utils.dart';

part  './constants.dart';

class Request {

  static final BaseOptions _options = BaseOptions(
    baseUrl:
        baseUrl,
    connectTimeout: const Duration(seconds: 8),
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json; charset=utf-8',
    headers: {
      'OS': '',
    }
  );

  static Dio dio = Dio(_options);

  static Future<T> _request<T>(String path,
      {required String method, Map? params, data}) async {
    // restful请求处理
    if (params != null) {
      params.forEach((key, value) {
        if (path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }
    debugPrint('发送的数据为: $data');
    // Map<String , dynamic> deviceData = await DeviceUtils.getDeviceData();
    // String systemName = deviceData["systemName"];
    dio.options.headers.addAll({"token" : "iOS"});
    try {
      Response response =
          await dio.request(path, data: data, options: Options(method: method));
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          if (response.data['errCode'] != 200) {
            EasyLoading.showInfo('服务器错误，状态码为: ${response.data['errMsg']}');
            return Future.error(response.data['errMsg']);
          } else {
            debugPrint('响应的数据为: ${response.data}');
            /*
            if (response.data['data'] is Map) {
              debugPrint('响应的数据为Map: ${response.data['data']}');
              return response.data['data'];
            } else if(response.data['data'] is List) {
              debugPrint('响应的数据是数组: ${response.data['data']}');
              return response.data['data'];
            } else {
              // return json.decode(response.data.toString());
              return response.data;
            }
            */
            return response.data['data'];
          }
        } catch (e) {
          debugPrint('解析响应数据异常: $e');
          return Future.error('解析响应数据异常');
        }
      } else {
        EasyLoading.showInfo('HTTP错误，状态码为: ${response.statusCode}');
        _handleHttpError(response.statusCode);
        return Future.error('HTTP错误');
      }
    } on DioException catch (e) {
      EasyLoading.showInfo(_dioError(e));
      return Future.error(_dioError(e));
    } catch (e) {
      debugPrint('未知异常: $e');
      return Future.error('未知异常');
    }
  }

  // 处理Dio异常
  static String _dioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "网络连接超时，请检查网络设置";
      case DioExceptionType.sendTimeout:
        return "网络连接超时，请检查网络设置";
      case DioExceptionType.receiveTimeout:
        return "接收数据超时，请稍后重试";
      case DioExceptionType.badResponse:
        return "服务器异常，请稍后重试";
      case DioExceptionType.cancel:
        return "请求被取消，请重新请求";
      case DioExceptionType.unknown:
        return "未知错误，请检查网络等原因";
      case DioExceptionType.connectionError:
        return "网络连接错误";
      default:
        return "未知错误";
    }
  }

  // 处理Http错误码
  static void _handleHttpError(int? errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码: $errorCode';
    }
    EasyLoading.showError(message);
  }

  // 这里只写了 get 和 post，其他的类型，比如 put，可自行添加
  static Future<T> get<T>(String path, {Map? params}) {
    return _request(path, method: 'get', params: params);
  }

  static Future<T> post<T>(String path, {Map? params, data}) {
    return _request(path, method: 'post', params: params, data: data);
  }
}
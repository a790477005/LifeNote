import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:lift_note/http/index.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// WebSocket状态
enum LSocketStatus {
  LSocketStatusConnected, // 已连接
  LSocketStatusFailed, // 失败
  LSocketStatusClosed, // 连接关闭
}

class LWebSocketUtil {
  /// 单例对象
  static LWebSocketUtil? _socket;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  LWebSocketUtil._internal();

  /// 获取单例内部方法
  factory LWebSocketUtil() => _socket ??= LWebSocketUtil._internal();

  IOWebSocketChannel? _webSocket; // WebSocket
  LSocketStatus? _socketStatus; // socket状态
  Timer? _heartBeat; // 心跳定时器
  final _heartTimes = 3000; // 心跳间隔(毫秒)
  final int _reconnectCount = 60; // 重连次数，默认60次
  int _reconnectTimes = 0; // 重连计数器
  Timer? _reconnectTimer; // 重连定时器
  Function? onError; // 连接错误回调
  Function? onOpen; // 连接开启回调
  Function? onMessage; // 接收消息回调

  late String uid;

  /// 初始化WebSocket
  void initWebSocket({ required String uid , Function? onOpen, Function? onMessage, Function? onError}) {
    this.onOpen = onOpen;
    this.onMessage = onMessage;
    this.onError = onError;

    this.uid = uid;
    openSocket();
  }

  /// 开启WebSocket连接
  void openSocket() async {
    var connectSocketUrl = socketUrl + '/$uid';
    closeSocket();
    _webSocket = IOWebSocketChannel.connect(connectSocketUrl);
    try {
      await _webSocket?.ready;
      debugPrint('WebSocket连接成功: $connectSocketUrl');
      // 连接成功，返回WebSocket实例
      _socketStatus = LSocketStatus.LSocketStatusConnected;
      // 连接成功，重置重连计数器
      _reconnectTimes = 0;
      if (_reconnectTimer != null) {
        _reconnectTimer!.cancel();
        _reconnectTimer = null;
      }
      onOpen?.call();
      // 接收消息
      _webSocket?.stream.listen((data) => webSocketOnMessage(data),
            onError: webSocketOnError, onDone: webSocketOnDone);
    } catch (e) {
      onError?.call(e.toString());
    }
  }

  /// WebSocket接收消息回调
  webSocketOnMessage(data) {
    onMessage?.call(data);
  }

  /// WebSocket关闭连接回调
  webSocketOnDone() {
    debugPrint('closed');
    reconnect();
  }

  /// WebSocket连接错误回调
  webSocketOnError(e) {
    WebSocketChannelException ex = e;
    _socketStatus = LSocketStatus.LSocketStatusFailed;
    onError?.call(ex.message);
    closeSocket();
  }

  /// 初始化心跳
  void initHeartBeat() {
    destroyHeartBeat();
    _heartBeat =
    Timer.periodic(Duration(milliseconds: _heartTimes), (timer) {
      sentHeart();
    });
  }

  /// 心跳
  void sentHeart() {
    sendMessage('{"uid": "$uid", "action": "ping"}', success: (){} , fail: (){});
  }

  /// 销毁心跳
  void destroyHeartBeat() {
    if (_heartBeat != null) {
      _heartBeat!.cancel();
      _heartBeat = null;
    }
  }

  /// 关闭WebSocket
  void closeSocket() {
    if (_webSocket != null) {
      debugPrint('WebSocket连接关闭');
      _reconnectTimes = 60;
      _webSocket!.sink.close();
      _webSocket = null;
      destroyHeartBeat();
      _socketStatus = LSocketStatus.LSocketStatusClosed;
    }
  }

  /// 发送WebSocket消息
  void sendMessage(message , {required Function success , required Function fail}) {
    if (_webSocket != null) {
      switch (_socketStatus) {
        case LSocketStatus.LSocketStatusConnected:
          debugPrint('发送中：' + message);
          _webSocket!.sink.add(message);
          success.call();
          break;
        case LSocketStatus.LSocketStatusClosed:
          debugPrint('连接已关闭');
          fail.call('连接已关闭');
          break;
        case LSocketStatus.LSocketStatusFailed:
          debugPrint('发送失败');
          fail.call('发送失败');
          break;
        default:
          break;
      }
    }
  }

  /// 重连机制
  void reconnect() {
    if (_reconnectTimes < _reconnectCount) {
      _reconnectTimes++;
      _reconnectTimer =
        Timer.periodic(Duration(milliseconds: _heartTimes), (timer) {
        openSocket();
      });
    } else {
      if (_reconnectTimer != null) {
        print('重连次数超过最大次数');
        _reconnectTimer!.cancel();
        _reconnectTimer = null;
      }
      return;
    }
  }
}

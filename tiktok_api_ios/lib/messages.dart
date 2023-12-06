// Autogenerated from Pigeon (v14.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

enum TikTokLoginStatus {
  success,
  cancelled,
  error,
}

class TikTokLoginResult {
  TikTokLoginResult({
    required this.status,
    this.authCode,
    this.state,
    this.codeVerifier,
    this.errorCode,
    this.errorMessage,
  });

  TikTokLoginStatus status;

  String? authCode;

  String? state;

  String? codeVerifier;

  String? errorCode;

  String? errorMessage;

  Object encode() {
    return <Object?>[
      status.index,
      authCode,
      state,
      codeVerifier,
      errorCode,
      errorMessage,
    ];
  }

  static TikTokLoginResult decode(Object result) {
    result as List<Object?>;
    return TikTokLoginResult(
      status: TikTokLoginStatus.values[result[0]! as int],
      authCode: result[1] as String?,
      state: result[2] as String?,
      codeVerifier: result[3] as String?,
      errorCode: result[4] as String?,
      errorMessage: result[5] as String?,
    );
  }
}

class _TiktokSDKApiCodec extends StandardMessageCodec {
  const _TiktokSDKApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is TikTokLoginResult) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return TikTokLoginResult.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class TiktokSDKApi {
  /// Constructor for [TiktokSDKApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  TiktokSDKApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _TiktokSDKApiCodec();

  Future<void> setup(String clientKey) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.tiktok_api_ios.TiktokSDKApi.setup';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[clientKey]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<TikTokLoginResult> login(List<String?> scopes, String redirectUri, bool? browserAuthEnabled) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.tiktok_api_ios.TiktokSDKApi.login';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[scopes, redirectUri, browserAuthEnabled]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as TikTokLoginResult?)!;
    }
  }
}

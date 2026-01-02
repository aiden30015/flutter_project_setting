import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// 앱 로거 유틸리티
class Logger {
  Logger._();

  static void debug(String message, {String? tag}) {
    if (kDebugMode) {
      developer.log(message, name: tag ?? 'DEBUG');
    }
  }

  static void info(String message, {String? tag}) {
    if (kDebugMode) {
      developer.log('ℹ️ $message', name: tag ?? 'INFO');
    }
  }

  static void warning(String message, {String? tag}) {
    if (kDebugMode) {
      developer.log('⚠️ $message', name: tag ?? 'WARNING');
    }
  }

  static void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      developer.log(
        '❌ $message',
        name: tag ?? 'ERROR',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

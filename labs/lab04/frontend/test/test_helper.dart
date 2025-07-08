import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class TestHelper {
  static void setupMockPlatformChannels() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.it_nomads.com/flutter_secure_storage'),
      (MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'deleteAll':
            return null;
          case 'read':
            return null; // Return null for non-existent keys
          case 'write':
            return null;
          case 'delete':
            return null;
          case 'readAll':
            return <String, String>{};
          case 'containsKey':
            return false;
          default:
            return null;
        }
      },
    );
  }
  
  static void tearDownMockPlatformChannels() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.it_nomads.com/flutter_secure_storage'),
      null,
    );
  }
}

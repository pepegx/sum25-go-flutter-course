import 'dart:async';

// ChatService handles chat logic and backend communication
class ChatService {
  // TODO: Use a StreamController to simulate incoming messages for tests
  // TODO: Add simulation flags for connection and send failures
  // TODO: Replace simulation with real backend logic in the future

  final StreamController<String> _controller =
      StreamController<String>.broadcast();
  bool failSend = false;
  bool failConnect = false;
  bool _connected = false;

  ChatService();

  Future<void> connect() async {
    // TODO: Simulate connection (for tests)
    if (failConnect) {
      throw Exception('Connect failed');
    }
    await Future.delayed(const Duration(milliseconds: 100));
    _connected = true;
  }

  Future<void> sendMessage(String msg) async {
    // TODO: Simulate sending a message (for tests)
    if (failSend) {
      throw Exception('Send failed');
    }
    if (!_connected) {
      throw Exception('Not connected');
    }
    
    await Future.delayed(const Duration(milliseconds: 50));
    _controller.add(msg);
  }

  Stream<String> get messageStream {
    // TODO: Return stream of incoming messages (for tests)
    return _controller.stream;
  }
  
  void dispose() {
    _controller.close();
  }
}

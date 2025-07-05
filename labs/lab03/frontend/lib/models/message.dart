// If you want to use freezed, you can use the following command:
// dart pub add freezed_annotation
// dart pub add json_annotation
// dart pub add build_runner
// dart run build_runner build

class Message {
  // TODO: Add final int id field
  final int id;
  // TODO: Add final String username field
  final String username;
  // TODO: Add final String content field
  final String content;
  // TODO: Add final DateTime timestamp field
  final DateTime timestamp;

  // TODO: Add constructor with required parameters:
  // Message({required this.id, required this.username, required this.content, required this.timestamp});
  Message({required this.id, required this.username, required this.content, required this.timestamp});

  // TODO: Add factory constructor fromJson(Map<String, dynamic> json)
  // Parse id from json['id']
  // Parse username from json['username']
  // Parse content from json['content']
  // Parse timestamp from json['timestamp'] using DateTime.parse()
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      username: json['username'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // TODO: Add toJson() method that returns Map<String, dynamic>
  // Return map with 'id', 'username', 'content', and 'timestamp' keys
  // Convert timestamp to ISO string using toIso8601String()
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class CreateMessageRequest {
  final String username;
  final String content;

  CreateMessageRequest({required this.username, required this.content});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'content': content,
    };
  }

  String? validate() {
    if (username.isEmpty) {
      return "Username is required";
    }
    if (content.isEmpty) {
      return "Content is required";
    }
    return null;
  }
}

class UpdateMessageRequest {
  final String content;

  UpdateMessageRequest({required this.content});

  Map<String, dynamic> toJson() {
    return {
      'content': content,
    };
  }

  String? validate() {
    if (content.isEmpty) {
      return "Content is required";
    }
    return null;
  }
}

class HTTPStatusResponse {
  final int statusCode;
  final String imageUrl;
  final String description;

  HTTPStatusResponse({required this.statusCode, required this.imageUrl, required this.description});

  factory HTTPStatusResponse.fromJson(Map<String, dynamic> json) {
    return HTTPStatusResponse(
      statusCode: json['status_code'],
      imageUrl: json['image_url'],
      description: json['description'],
    );
  }
}

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? error;

  ApiResponse({required this.success, this.data, this.error});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>)? fromJsonT) {
    return ApiResponse<T>(
      success: json['success'] ?? true,
      data: json['data'] != null && fromJsonT != null ? fromJsonT(json['data']) : null,
      error: json['error'],
    );
  }
}

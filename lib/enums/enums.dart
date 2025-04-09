enum ViewState {
  /// The view is not doing anything.
  idle,

  /// The view is loading something.
  busy,
}

enum MessageType {
  /// Represents error message.
  error,

  /// Represents warning message.
  warning,

  /// Represents info message.
  info,

  /// Represents random message.
  random
}

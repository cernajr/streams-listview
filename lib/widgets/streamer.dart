import 'dart:async';
import 'dart:math';

class Streamer {
  final _controller = StreamController<String>();
  final _random = Random();
  String _lastMessage = '';
  final _messages = [
    "Amanecer en la montaña",
    "Correr bajo la lluvia",
    "Un libro por leer",
    "Música suave, té caliente",
    "Viaje al centro del mar",
    "Bailando bajo la luna",
    "Estrellas fugaces en julio",
    "Café y galletas caseras",
    "Paseo nocturno por la ciudad",
    "Sonrisa de un niño",
  ];

  Stream<String> get message => _controller.stream;

  void startMessages() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      String newMessage;
      do {
        newMessage = _messages[_random.nextInt(_messages.length)];
      } while (newMessage == _lastMessage);
      _lastMessage = newMessage;
      _controller.sink.add(newMessage);
    });
  }

  void dispose() {
    _controller.close();
  }
}


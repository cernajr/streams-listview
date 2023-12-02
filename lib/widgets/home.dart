import 'package:flutter/material.dart';
import 'streamer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _texto = Streamer();
  final List<String> _prueba = [];

  @override
  void initState() {
    super.initState();
    _texto.startMessages();
  }

  @override
  void dispose() {
    _texto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prueba Corta #2 Jorge Cerna - 42111148"),
      ),
      body: Center(
        child: StreamBuilder<String>(
            stream: _texto.message,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.data != null) {
                  _prueba.add(snapshot.data!);
                }
                return ListView.builder(
                    itemCount: _prueba.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _prueba[index],
                          textAlign: TextAlign.center,
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}

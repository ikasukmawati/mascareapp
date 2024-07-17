import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Visualisasi extends StatefulWidget {
  @override
  _VisualisasiViewState createState() => _VisualisasiViewState();
}

class _VisualisasiViewState extends State<Visualisasi> {
  final String url =
<<<<<<< HEAD
      'http://192.168.25.85:8501'; // Replace with your Flask server URL
=======
      'http://192.168.163.85:8501'; // Replace with your Flask server URL
>>>>>>> f18f6de8d3e6239a1ef63dad41389910fb9da677

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualisasi'),
        backgroundColor: Color.fromRGBO(209, 209, 239, 1),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(url), // Gunakan WebUri sebagai pengganti Uri
        ),
      ),
    );
  }
}

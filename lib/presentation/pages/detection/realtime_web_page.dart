import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CameraView extends StatefulWidget {
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final String url =
<<<<<<< HEAD
      'http://192.168.25.85:5000/video_feed'; // Ganti dengan URL server Flask Anda
=======
      'http://192.168.163.85:5000/video_feed'; // Ganti dengan URL server Flask Anda
>>>>>>> f18f6de8d3e6239a1ef63dad41389910fb9da677

  bool _isLoading = true; // Variabel untuk mengelola status loading

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime Object Counting'),
        backgroundColor: Color.fromRGBO(209, 209, 239, 1),
      ),
      body: Column(
        children: [
          _isLoading
              ? LinearProgressIndicator()
              : SizedBox
                  .shrink(), // Menggunakan SizedBox.shrink untuk menghilangkan widget jika tidak diperlukan
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri.uri(Uri.parse(url)),
              ),
              onLoadStart: (controller, url) {
                // Set status loading ke true ketika halaman mulai dimuat
                setState(() {
                  _isLoading = true;
                });
                setState(() {
                  _isLoading = false;
                });
              },
              onLoadStop: (controller, url) async {
                // Set status loading ke false ketika halaman selesai dimuat
                setState(() {
                  _isLoading = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

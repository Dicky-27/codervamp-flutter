/*
  Hi!!!

  This file is organized into sections for easy navigation.

  Sections:
  - Initialization
  - Capture QR Image Function
  - Generate QR
  - Input Link UI
  

  Search using section mark like "// MARK: - Variables" to find specific content.

  Don't forget to give a star on my GitHub!
*/

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;

class QRGeneratorWidget extends StatefulWidget {
  const QRGeneratorWidget({super.key});

  @override
  State<QRGeneratorWidget> createState() => _QRGeneratorWidgetState();
}

class _QRGeneratorWidgetState extends State<QRGeneratorWidget> {
  // MARK: - Initialization
  final TextEditingController _linkController = TextEditingController();
  final GlobalKey _globalKey = GlobalKey();
  String? _qrData;

  // MARK: - Capture QR Image Function
  void _captureQrImage() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject()! as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Get temporary directory
      final directory = (await getTemporaryDirectory()).path;
      File imgFile = File('$directory/qr_code.png');
      await imgFile.writeAsBytes(pngBytes);

      // Share the file
      Share.shareXFiles([XFile(imgFile.path)], text: 'QR Code');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // MARK: - Generate QR
  void _generateQR() {
    setState(() {
      _qrData = _linkController.text;
    });
    if (_qrData!.isNotEmpty) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RepaintBoundary(
                  key: _globalKey,
                  child: QrImageView(
                    backgroundColor: Colors.grey[900] ?? Colors.black,
                    data: _qrData ?? "",
                    version: QrVersions.auto,
                    size: 200.0,
                    eyeStyle: const QrEyeStyle(
                        color: Colors.white, eyeShape: QrEyeShape.square),
                    dataModuleStyle:
                        const QrDataModuleStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _actionButton(
                      icon: Icons.share,
                      label: "Share",
                      onPressed: () => _captureQrImage(),
                      context: context,
                    ),
                    const SizedBox(width: 20),
                    _actionButton(
                      icon: Icons.copy,
                      label: "Copy",
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: _qrData ?? ""));
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                                  "COPIED!",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black));
                      },
                      context: context,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    }
  }

  Widget _actionButton(
      {required IconData icon,
      required String label,
      required VoidCallback onPressed,
      required BuildContext context}) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.teal),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  // MARK: - Input Link UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.teal],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _linkController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Enter your link here",
                labelStyle: const TextStyle(color: Colors.cyan),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.tealAccent, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.cyan, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.link, color: Colors.cyan),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateQR,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Generate QR',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRView extends StatefulWidget {
  final String? qrData;
  const QRView({super.key,this.qrData});

  @override
  State<QRView> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child:
         (widget.qrData != null)?
         QrImageView(
                  data: widget.qrData??'',
                  version: QrVersions.auto,
                  size: 250.0,
                  embeddedImage:  const AssetImage('assets/images/logo.jpg'),
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(30, 30),
                  ),
                  gapless: false,
                ):
                const Text('No QR Data'),
      ),
    );
  }
}
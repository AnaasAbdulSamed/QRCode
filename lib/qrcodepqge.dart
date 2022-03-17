import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';





class qrcode extends StatefulWidget {
  const qrcode({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _qrcodeState();
}

class _qrcodeState extends State<qrcode> {

  Result? currentResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRCodeDartScanView(
            scanInvertedQRCode: true,
            onCapture: (Result result) {
              setState(() {
                currentResult = result;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Text: ${currentResult?.text ?? 'Not found'}'),
                  Text(
                      'Format: ${currentResult?.barcodeFormat ?? 'Not found'}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



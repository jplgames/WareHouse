import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:zeus.go/app/core/theme/layoutbar.dart';

class CodeCam extends GetView {
  @override
  Widget build(BuildContext context) {
    return LayoutBar(
        route: '/home',
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Warehouse Manager',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                  onPressed: () async {
                    String? barcode = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancelar', true, ScanMode.BARCODE);
                    if (barcode != '-1') {
                      Get.back(result: barcode);
                    }
                  },
                  child: Text('Escanear codigo de barras.'))
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCaloriesScreen extends StatelessWidget {
  const ScanCaloriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Skano Kaloritë (QR Code)")),
      body: MobileScanner(
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            debugPrint('Barcode i gjetur: ${barcode.rawValue}');
            // Këtu mund të shtoni logjikën për të treguar kaloritë bazuar te QR
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("U gjet: ${barcode.rawValue} kalori")),
            );
          }
        },
      ),
    );
  }
}

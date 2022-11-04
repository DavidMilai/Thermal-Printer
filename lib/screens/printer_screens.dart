import 'package:ThermalPrinter/screens/pos_printer_screen.dart';
import 'package:flutter/material.dart';

class PrinterScreens extends StatelessWidget {
  const PrinterScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Printer List")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(
                child: Text("POS Printer"),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PosPrinterScreen())))
          ],
        ),
      ),
    );
  }
}

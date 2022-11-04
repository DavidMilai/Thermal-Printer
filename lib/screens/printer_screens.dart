import 'package:ThermalPrinter/screens/pos_printer_screen.dart';
import 'package:flutter/material.dart';

import 'blue_thermal_printer_screen.dart';

class PrinterScreens extends StatelessWidget {
  const PrinterScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Printer List")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text("POS Printer"),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PosPrinterScreen()))),
            ElevatedButton(
                child: Text("Blue Thermal Printer"),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlueThermalPrinterScreen())))
          ],
        ),
      ),
    );
  }
}

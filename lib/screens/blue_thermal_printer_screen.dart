import 'package:flutter/material.dart';
import 'package:blue_thermal_printer_example/testprint.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';

class BlueThermalPrinterScreen extends StatefulWidget {
  const BlueThermalPrinterScreen({Key key}) : super(key: key);

  @override
  State<BlueThermalPrinterScreen> createState() =>
      _BlueThermalPrinterScreenState();
}

class _BlueThermalPrinterScreenState extends State<BlueThermalPrinterScreen> {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _device;
  bool _connected = false;
  TestPrint testPrint = TestPrint();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blue Thermal Printer")),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("Text Printer"),
            onPressed: () {
              // testReceipt()
            },
          ),
        ),
      ),
    );
  }
}

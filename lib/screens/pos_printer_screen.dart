import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';

class PosPrinterScreen extends StatefulWidget {
  const PosPrinterScreen({Key key}) : super(key: key);

  @override
  State<PosPrinterScreen> createState() => _PosPrinterScreenState();
}

class _PosPrinterScreenState extends State<PosPrinterScreen> {
  PaperSize paper = PaperSize.mm80;
  var profile;
  var printer;
  PosPrintResult res;

  setup() async {
    profile = await CapabilityProfile.load();
    printer = NetworkPrinter(paper, profile);

    res = await printer.connect('192.168.0.123', port: 9100);
    print("Testing 1");
    if (res == PosPrintResult.success) {
      print("Testing 2");
      testReceipt(printer);
      printer.disconnect();
    }

    print('Print result: ${res.msg}');
  }

  void testReceipt(NetworkPrinter printer) {
    printer.text(
        'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
    printer.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ',
        styles: PosStyles(codeTable: 'CP1252'));
    printer.text('Special 2: blåbærgrød',
        styles: PosStyles(codeTable: 'CP1252'));

    printer.text('Bold text', styles: PosStyles(bold: true));
    printer.text('Reverse text', styles: PosStyles(reverse: true));
    printer.text('Underlined text',
        styles: PosStyles(underline: true), linesAfter: 1);
    printer.text('Align left', styles: PosStyles(align: PosAlign.left));
    printer.text('Align center', styles: PosStyles(align: PosAlign.center));
    printer.text('Align right',
        styles: PosStyles(align: PosAlign.right), linesAfter: 1);

    printer.text('Text size 200%',
        styles: PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    printer.feed(2);
    printer.cut();
  }

  @override
  void initState() {
    super.initState();
    print("Testing 001");
    setup();
    print("Testing 002");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("POS Printer")),
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

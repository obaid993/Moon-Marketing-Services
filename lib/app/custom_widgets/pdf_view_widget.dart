// ignore_for_file: unused_local_variable, avoid_print

import 'dart:async';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pdfx/pdfx.dart';
// ignore: depend_on_referenced_packages
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewWidget extends StatefulWidget {
  final String path;

  const PdfViewWidget({super.key, required this.path});
  @override
  State<PdfViewWidget> createState() => _PdfViewWidgetState();
}

class _PdfViewWidgetState extends State<PdfViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {}
    return Scaffold(
      appBar: AppBar(
        title: const Text("View PDF"),
      ),
      body: FutureBuilder(
        future: loadPdf(widget.path),
        builder: (context, asyncSnapshot) {
          switch (asyncSnapshot.connectionState) {
            case ConnectionState.done:
              if (asyncSnapshot.hasError) {
                print("Something went Wrong ${asyncSnapshot.error}");
              }
              if (asyncSnapshot.hasData) {
                print("Data is ${asyncSnapshot.data}");
              }
              // return PdfView(
              //   controller: PdfController(
              //     document: PdfDocument.openFile(asyncSnapshot.data!),
              //   ),
              // );
              final pdfData = asyncSnapshot.data;
              return PDFView(
                pdfData: pdfData,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      //  FutureBuilder(
      //   future: getPdfDocument(),
      //   builder: (context, asyncSnapshot) {
      //     switch (asyncSnapshot.connectionState) {
      //       case ConnectionState.done:
      //         if (asyncSnapshot.hasError) {
      //           print("Something went Wrong ${asyncSnapshot.error}");
      //         }
      //         if (asyncSnapshot.hasData) {
      //           print("Data is ${asyncSnapshot.data}");
      //         }
      //         // return PdfView(
      //         //   controller: PdfController(
      //         //     document: PdfDocument.openFile(asyncSnapshot.data!),
      //         //   ),
      //         // );
      //         final pdf = asyncSnapshot.data as PdfDocument;
      //         return PdfView(
      //           controller: PdfController(
      //             document: PdfDocument.openData(loadPdf(widget.path)),
      //           ),
      //           backgroundDecoration: const BoxDecoration(
      //             color: Colors.white,
      //           ),
      //           onDocumentError: (e) {
      //             print("Something went wront $e");
      //           },
      //           onDocumentLoaded: (document) {
      //             print('Document loaded');
      //           },
      //         );
      //       default:
      //         return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      final url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
  // Future<PdfDocument> getPdfDocument() async {
  //   final pdf = await PdfDocument.openData(loadPdf(widget.path));
  //   return pdf;
  // }

  Future<Uint8List> loadPdf(remotePath) async {
    print("Remote path :$remotePath");
    Completer<File> completer = Completer();
    final filename = remotePath.substring(remotePath.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(remotePath));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    var dir = await getApplicationDocumentsDirectory();

    File file = File("${dir.path}/$filename");

    // await file.writeAsBytes(bytes, flush: true);
    return bytes;
    // completer.complete(file);
    // return file.path;
  }

  Future<void> printDoc() async {
    final pdf = pw.Document();
    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }
}

import 'package:cse_connect/locator.dart';
import 'package:cse_connect/view_model/pdf_view_model.dart';
import 'package:cse_connect/views/base_view.dart';
import 'package:cse_connect/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfView extends StatefulWidget {
  final String url;
  final String name;
  const PdfView({super.key, required this.url,required this.name});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<PDFViewModel>(
      onModelReady: (model) async {
        model.onModelReady(widget.url);
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                navigationService.popScreen();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
            title: Text(
              widget.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w200,
                  ),
            ),
            toolbarHeight: 60,
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primaryFixed,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          body: SafeArea(
            child: model.isBusy
                ? const Loader()
                : PDFView(
                    pdfData: model.pdfBytes,
                    enableSwipe: true,
                    swipeHorizontal: false,
                    autoSpacing: false,
                    pageFling: false,
                  ),
          ),
        );
      },
    );
  }
}

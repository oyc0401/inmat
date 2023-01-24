import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({Key? key}) : super(key: key);

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( child: Image.network(
        'https://inmat.s3.ap-northeast-1.amazonaws.com/everytime-1672503845094.jpg',
      ),),
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'image_viewer.dart';

class S3Example extends StatefulWidget {
  S3Example({Key? key}) : super(key: key);

  @override
  _S3ExampleState createState() => _S3ExampleState();
}

class _S3ExampleState extends State<S3Example> {
  final List<PlatformFile> _files = [];

  void _pickFiles() async {
    List<PlatformFile>? uploadedFiles = (await FilePicker.platform.pickFiles(
      allowMultiple: true,
    ))
        ?.files;
    setState(() {
      for (PlatformFile file in uploadedFiles!) {
        _files.add(file);
      }
    });
  }

  Future<int> _uploadToSignedURL(
      {required PlatformFile file, required String url}) async {
    print(file);
    print(file.bytes);

    Uint8List? byte = await _readFileByte(file.path!);

    http.Response response = await http.put(Uri.parse(url), body: byte);
    print(response.statusCode);
    print(response.body);

    return response.statusCode;
  }

  Future<Uint8List?> _readFileByte(String filePath) async {
    Uri myUri = Uri.parse(filePath);
    File audioFile = new File.fromUri(myUri);
    Uint8List? bytes;
    await audioFile.readAsBytes().then((value) {
      bytes = Uint8List.fromList(value);
      print('reading of bytes is completed');
    }).catchError((onError) {
      print('Exception Error while reading audio from path:' +
          onError.toString());
    });
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S3 테스트'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFiles,
              child: Text("Choose a file"),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
              width: 350,
              height: 500,
              child: Scrollbar(
                isAlwaysShown: true,
                child: ListView.builder(
                  itemCount: _files.isEmpty ? 1 : _files.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _files.isEmpty
                        ? const ListTile(
                            title:
                                Text("파일을 업로드해주세요 - 한 번에 여러 파일을 업로드할 수 있습니다"))
                        : ListTile(
                            title: Text(_files.elementAt(index).name),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  _files.removeAt(index);
                                });
                              },
                            ),
                          );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _uploadToSignedURL(
                    file: _files.elementAt(0),
                    url:
                        "https://inmat.s3.amazonaws.com/everytime-1672503845094.jpg?AWSAccessKeyId=AKIA4I52XCBNMHK3JNUZ&Signature=oeCwgz4RmZ5ScC56ou%2FY4B%2Br274%3D&Expires=1674562786"
                    // "https://inmat.s3.amazonaws.com/test.md?AWSAccessKeyId=AKIA4I52XCBNMHK3JNUZ&Signature=Q7AMXFVsmzGL4Am5Qm0wbLyUuP4%3D&Expires=1674558317"
                    );
              },
              child: Text("Upload to S3"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ImageViewer()));
              },
              child: Text("view image"),
            ),
          ],
        ),
      ),
    );
  }
}

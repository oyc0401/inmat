import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ImageToUrl {
  Future<String> getUrl() async {
    FilePickerResult? upload = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (upload == null) {
      throw '취소';
    }

    PlatformFile file = upload.files.first;
    String path = file.path!;
    String fileName = file.name;
    print(file);

    String url = await InMatApi.utils
        .getImageUrl(fileName, InMatAuth.instance.currentUser!.token);

    print(url);

    if (!kIsWeb) {
      Uri myUri = Uri.parse(file.path!);
      File audioFile = File.fromUri(myUri);
    } else {}

    await _uploadToSignedURL(file: file, url: url);

    return "https://inmat.s3.ap-northeast-1.amazonaws.com/$fileName";
  }

  Future<String> getCameraUrl(String path) async {
    File file = File(path);
    String name = basename(file.path);

    print(file);
    print(name);

    String url = await InMatApi.utils
        .getImageUrl(name, InMatAuth.instance.currentUser!.token);

    Uint8List? byte;

    if (kIsWeb) {
      byte = file.readAsBytesSync();

      print("카메라??");
    } else {
      byte = await _readFileByte(file.path);
    }

    http.Response response = await http.put(Uri.parse(url), body: byte);
    print(response.statusCode);
    print(response.body);

    return "https://inmat.s3.ap-northeast-1.amazonaws.com/$name";

    // PlatformFile platformFile=PlatformFile(name: name, size: size)
// /data/user/0/com.oyc0401.beontteuk/cache/CAP9081181283050997484.jpg

    // String url= await InMatApi.community.getImageUrl(path);
    //
    // print(url);
    //
    // // print(upload.files.first.bytes);
    //
    //
    // url= url.replaceAll ('inmat.s3.ap-northeast-2.amazonaws.com', 'inmat.s3-ap-northeast-1.amazonaws.com');
    //
    // print(url);
    //
    // await _uploadToSignedURL(file: upload.files.first,url: url);
    //
    //
    // return "https://inmat.s3.ap-northeast-1.amazonaws.com/${upload.files.first.name}";
  }

  Future<Uint8List?> _fileToByte(PlatformFile file) async {
    Uint8List? byte;
    if (kIsWeb) {
      byte = file.bytes;
    } else {
      byte = await _readFileByte(file.path!);
    }

    return byte;
  }

  Future<int> _uploadToSignedURL(
      {required PlatformFile file, required String url}) async {
    Uint8List? byte = await _fileToByte(file);

    http.Response response = await http.put(Uri.parse(url), body: byte);
    print(response.statusCode);
    print(response.body);

    return response.statusCode;
  }

  Future<Uint8List?> _readFileByte(String filePath) async {
    Uri myUri = Uri.parse(filePath);
    File audioFile = File.fromUri(myUri);
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
}

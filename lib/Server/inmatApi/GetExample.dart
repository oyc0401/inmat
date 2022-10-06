import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Server/inmatApi/GetPreferMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetExample(),
    );
  }
}

class GetExample extends StatefulWidget {
  const GetExample({Key? key}) : super(key: key);

  @override
  State<GetExample> createState() => _GetExampleState();
}

class _GetExampleState extends State<GetExample> {
  MenuThumbnail menuThumbnail =
      MenuThumbnail(id: "id", imageUrl: "menuUrl", name: "name");

  setMenu() async {
    menuThumbnail = await InMatApi.home.Getprefer(Gender.man);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api")),
      body: Column(children: [
        Text(menuThumbnail.id),
        Text(menuThumbnail.imageUrl),
        Text(menuThumbnail.name),
        CupertinoButton(
          child: Text("버튼"),
          onPressed: () {
            setMenu();
          },
        )
      ]),
    );
  }
}

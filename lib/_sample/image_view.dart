import 'package:flutter/material.dart';

void main() => runApp(const ImageView());

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Container(color: Colors.red,height: 100,),
            Image.network("https://lh3.googleusercontent.com/p/AF1QipOkTLqiIbD6ZarWJcISpDyoiHsvTVOPxVe0HEk=s1360-w1360-h1020",fit: BoxFit.cover,),
            Image.network("https://lh3.googleusercontent.com/p/AF1QipOkTLqiIbD6ZarWJcISpDyoiHsvTVOPxVe0HEk=s1360-w1360-h1020",fit: BoxFit.cover,),
          ],
        ),
      ),
    );
  }
}

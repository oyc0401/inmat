
import 'package:flutter/material.dart';

class KeywordPage extends StatelessWidget {
  const KeywordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          color: Colors.redAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: const Text('짬뽐',
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Text('짜장면',
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Text('3. 갈비탕',
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Text('4. 삼겹살',
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Text('5. 돈가스',
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

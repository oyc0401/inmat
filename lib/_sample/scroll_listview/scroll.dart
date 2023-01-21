import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScrollModel(),
      child: MaterialApp(
        home: ScrollPage(),
      ),
    );
  }
}

class ScrollModel with ChangeNotifier {
  Map post = {
    'context': '안녕',
    'comments': [
      {
        'id': 1,
        'context': '댓글 1',
      },
      {
        'id': 2,
        'context': '댓글 2',
      },
      {
        'id': 3,
        'context': '댓글 3',
      }
    ]
  };

  Future<int> addComment(int id) async {
    post['comments'].add(
      {
        'id': id,
        'context': '댓글 $id',
      },
    );

    Future.delayed(Duration(microseconds: 500));
    notifyListeners();
    return id;
  }
}

int lastId = 3;

class ScrollPage extends StatelessWidget {
  ScrollPage({Key? key}) : super(key: key);

  final Map<int, GlobalKey> keys = {};

  @override
  Widget build(BuildContext context) {
    print('ui 빌드');
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: cards(context),
        ),
      ),
      bottomNavigationBar: CupertinoButton(
        onPressed: () {
          onclick(context);
        },
        child: const Text("Scroll to data"),
      ),
    );
  }

  List<Widget> cards(BuildContext context) {
    List<Widget> list = [];

    for (Map map in Provider.of<ScrollModel>(context).post['comments']) {
      int id = map['id'];
      GlobalKey key = keys[id] ?? GlobalKey();

      list.add(
        SizedBox(
          height: 160.0,
          width: double.infinity,
          child: Card(
            key: key,
            color: Colors.green,
            child: Text('${map['context']}'),
          ),
        ),
      );
    }

    return list;
  }

  void onclick(BuildContext context) async {
    lastId++;

    int id = await Provider.of<ScrollModel>(context, listen: false)
        .addComment(lastId);
    print('key 추가');
    keys[id] = GlobalKey();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      print('스크롤 이동');
      GlobalKey thisKey = keys[id]!;
      Scrollable.ensureVisible(thisKey.currentContext!);
    });
    print('click 마무리');
  }
}

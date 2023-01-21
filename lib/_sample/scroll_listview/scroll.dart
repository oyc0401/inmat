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

  addComment(int id) {
    post['comments'].add(
      {
        'id': id,
        'context': '댓글 $id',
      },
    );
    notifyListeners();
  }
}

class ScrollPage extends StatefulWidget {
  ScrollPage({Key? key}) : super(key: key);

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  List<Widget> widgets = [
    const SizedBox(
      height: 160.0,
      width: double.infinity,
      child: Card(
        color: Colors.red,
      ),
    ),
    const SizedBox(
      height: 160.0,
      width: double.infinity,
      child: Card(
        color: Colors.orange,
      ),
    ),
    const SizedBox(
      height: 160.0,
      width: double.infinity,
      child: Card(
        color: Colors.yellow,
      ),
    ),
    const SizedBox(
      height: 160.0,
      width: double.infinity,
      child: Card(
        color: Colors.green,
      ),
    ),
    const SizedBox(
      height: 160.0,
      width: double.infinity,
      child: Card(
        color: Colors.blue,
      ),
    ),
  ];

  GlobalKey dataKey = GlobalKey();

  Map<int, GlobalKey> keys = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [...cards()],
        ),
      ),
      floatingActionButton: CupertinoButton(
        onPressed: () {
          Scrollable.ensureVisible(dataKey.currentContext!);
        },
        child: const Text("Scroll to data"),
      ),
      bottomNavigationBar: CupertinoButton(
        onPressed: () {
          // dataKey = GlobalKey();
          Provider.of<ScrollModel>(context, listen: false).addComment(4);
          keys[4]=GlobalKey();

          SchedulerBinding.instance.addPostFrameCallback((_) {
            GlobalKey thisKey=keys[4]!;
            print('a');
            Scrollable.ensureVisible(thisKey.currentContext!);
          });
        },
        child: const Text("Scroll to data"),
      ),
    );
  }

  List<Widget> cards() {
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
            child: Text('${map['context']}'),
            color: Colors.green,
          ),
        ),
      );
    }

    return list;
  }
}

List<Widget> widgets = [
  const SizedBox(
    height: 160.0,
    width: double.infinity,
    child: Card(
      color: Colors.red,
    ),
  ),
  const SizedBox(
    height: 160.0,
    width: double.infinity,
    child: Card(
      color: Colors.orange,
    ),
  ),
  const SizedBox(
    height: 160.0,
    width: double.infinity,
    child: Card(
      color: Colors.yellow,
    ),
  ),
  const SizedBox(
    height: 160.0,
    width: double.infinity,
    child: Card(
      color: Colors.green,
    ),
  ),
  const SizedBox(
    height: 160.0,
    width: double.infinity,
    child: Card(
      color: Colors.blue,
    ),
  ),
];

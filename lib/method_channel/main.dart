import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'android_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: const AndroidPage(),
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   static const platform = MethodChannel('com.yumyum.inmat/android');
//
//   String _batteryLevel = 'Unknown battery level.';
//
//   Future<void> _getBatteryLevel() async {
//     String batteryLevel;
//     try {
//       final int result = await platform.invokeMethod('getBatteryLevel');
//       batteryLevel = 'Battery level at $result % .';
//     } on PlatformException catch (e) {
//       batteryLevel = "Failed to get battery level: '${e.message}'.";
//     }
//
//     setState(() {
//       _batteryLevel = batteryLevel;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("method channel"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             CupertinoButton(
//               child: Text("dsa"),
//               onPressed: _getBatteryLevel,
//             ),
//             Text(_batteryLevel),
//           ],
//         ),
//       ),
//     );
//   }
// }

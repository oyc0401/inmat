import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RandomFood.dart';
import 'Meal.dart';
import 'Drink.dart';

class RandomFoodSelect extends StatelessWidget {
  const RandomFoodSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("음식 랜덤 추천"),
      ),
      body: const SafeArea(
        child: Center(child: Text("개발 중 입니다.")),
      ),
    );
  }
}

// class RandomFoodSelect extends StatefulWidget {
//   const RandomFoodSelect({Key? key}) : super(key: key);
//
//   @override
//   State<RandomFoodSelect> createState() => _RandomFoodSelectState();
// }
//
// class _RandomFoodSelectState extends State<RandomFoodSelect> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("음식 랜덤 추천"),
//       ),
//       body: SafeArea(
//         child:
//         Container(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 300,
//                 height: 200,
//                 child: CupertinoButton(
//                     minSize: 0.0,
//                     padding: EdgeInsets.all(0),
//                     color: Colors.grey,
//                     child: Text("밥"),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         CupertinoPageRoute(
//                           builder: (context) => const Meal(),
//                         ),
//                       );
//                     }),
//               ),
//               Container(
//                 width: 300,
//                 height: 200,
//                 child: CupertinoButton(
//                     minSize: 0.0,
//                     padding: EdgeInsets.all(0),
//                     color: Colors.grey,
//                     child: Text("술"),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         CupertinoPageRoute(
//                           builder: (context) => const Drink(),
//                         ),
//                       );
//                     }),
//               ),
//
//               // CupertinoButton(color: Colors.grey, child: Text("카페"), onPressed: (){}),
//
//               CupertinoButton(
//                   child: Text("회원가입 페이지 이동"),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       CupertinoPageRoute(
//                         builder: (context) => const RandomFood(),
//                       ),
//                     );
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget meal() {
//     return GestureDetector(
//       onTap: () {
//         print("Tap");
//       },
//       onLongPress: () {
//         print("Long Press");
//       },
//       child: Container(
//         child: Text(
//           '밥',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 80,
//             height: 1.0,
//             color: Colors.black,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//         ),
//         width: 800,
//         height: 150,
//       ),
//     );
//   }
//
//   // Container cafe() {
//   //   return Container(
//   //                child: Text('카페',
//   //                  style: TextStyle(
//   //                    fontWeight: FontWeight.bold,
//   //                    fontSize: 80,
//   //                    height: 1.0,
//   //                    color: Colors.black,
//   //                  ),
//   //                  textAlign: TextAlign.center,
//   //                ),
//   //                decoration: BoxDecoration(
//   //                  color: Colors.grey[300],
//   //                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
//   //                ),
//   //                width: 800,
//   //                height: 150,
//   //              );
//   // }
//
//   InkWell buildInkWell() {
//     return InkWell(
//       child: Container(
//         child: Text(
//           '술',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 80,
//             height: 1.0,
//             color: Colors.black,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//         ),
//         width: 800,
//         height: 150,
//       ),
//       onTap: () {
//         print("TapTap");
//       },
//     );
//   }
// }

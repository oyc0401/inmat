//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:inmat/screens/community/list/community_model.dart';
//
// class PostWidget extends StatelessWidget {
//   const PostWidget({Key? key, required this.data}) : super(key: key);
//   final PostData data;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           CupertinoPageRoute(
//               builder: (context) => CommunityView(id: data.postId)),
//         );
//       },
//       child: Text(data.toString()),
//     );
//   }
// }

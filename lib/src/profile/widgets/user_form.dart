import 'package:flutter/material.dart';
import 'package:inmat/utils/inmat_colors.dart';

class UserForm extends StatelessWidget {
  const UserForm({
    Key? key,
    required this.profileImgUrl,
    required this.nickName,
    required this.onclick,
  }) : super(key: key);

  final String? profileImgUrl;
  final String nickName;
  final VoidCallback onclick;

  // final User user = InMatAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
            color: Colorss.skeleton,
            // image: DecorationImage(
            //   image: AssetImage('assets/images/profilesample.png'),
            //   fit: BoxFit.cover,
            // ),
            shape: BoxShape.circle),
        child: Center(child: Text('${profileImgUrl}')),
      ),
      title: Text('user.email'),
      subtitle: Text(nickName),
      trailing: TextButton(
        onPressed: onclick,
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
        ),
        child: const Text(
          '회원 정보 수정',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

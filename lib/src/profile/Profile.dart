import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/utils/toast.dart';
import 'package:provider/provider.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/auth/user_model.dart';

import '../account/update_profile/change_profile.dart';
import '../account/login_main/signin_page.dart';

import 'MyFavorite.dart';
import 'MyPost.dart';
import 'MyReview.dart';
import 'Notice.dart';
import 'ProfileModel.dart';
//화면 이동

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileModel(),
      child: Consumer(builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("마이페이지"),
            // actions: <screens>[
            //   IconButton(
            //     icon: const Icon(Icons.settings),
            //     onPressed: () {},
            //   )
            // ],
          ),
          body: Column(
            children: [
              Provider.of<ProfileModel>(context).isUser
                  ? UserForm()
                  : const LoginButton(),
              Container(
                height: 1.0,
                color: Colors.black,
              ),
              Provider.of<ProfileModel>(context).isUser
                  ? MyInformation()
                  : Container(),
              Spacer(),
              Provider.of<ProfileModel>(context).isUser
                  ? LogOutButton()
                  : Container(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class UserForm extends StatelessWidget {
  UserForm({
    Key? key,
  }) : super(key: key);

  final User user = InMatAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
            color: Colors.grey,
            // image: DecorationImage(
            //   image: AssetImage('assets/images/profilesample.png'),
            //   fit: BoxFit.cover,
            // ),
            shape: BoxShape.circle),
        child: Center(child: Text('${user.profileImgUrl}')),
      ),
      title: Text('user.email'),
      subtitle: Text(user.nickName),
      trailing: TextButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (_) => const ChangeProfile()));
        },
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

class MyInformation extends StatelessWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.favorite,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (_) => const MyFavorite()));
          },
          title: const Text("내가 좋아요 누른 음식점", style: TextStyle(fontSize: 18)),
        ),
        ListTile(
          leading: const Icon(
            Icons.list,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (_) => const MyReview()));
          },
          title: const Text("내가 쓴 리뷰", style: TextStyle(fontSize: 18)),
        ),
        ListTile(
          leading: const Icon(
            Icons.article,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (_) => const MyPost()));
          },
          title: const Text("내가 쓴 게시글", style: TextStyle(fontSize: 18)),
        ),
        ListTile(
          leading: const Icon(
            Icons.description,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (_) => const Notice()));
          },
          title: const Text("공지사항", style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(12),
        color: const Color(0xffefefef),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (_) => const SignInMainPage()));
          },
          child: Container(
            height: 48,
            child: const Center(
                child: Text(
              '로그인',
              style: TextStyle(fontSize: 18),
            )),
          ),
        ));
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoButton(
        color: Colors.redAccent,
        child: const Text("로그아웃"),
        onPressed: () {
          InMatAuth.instance.signOut();
          Provider.of<ProfileModel>(context, listen: false).logout();
        },
      ),
    );
  }
}

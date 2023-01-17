import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/utils/toast.dart';
import 'package:provider/provider.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/auth/user_model.dart';

import '../account/update_profile/change_profile.dart';
import '../account/login_main/signin_page.dart';

import 'my_favorite.dart';
import 'my_post.dart';
import 'my_review.dart';
import 'notice.dart';
import 'providers/profile_view_model.dart';
import 'widgets/user_form.dart';
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
                  ? UserForm(
                onclick: (){
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => const ChangeProfile()));
                },
                      nickName: InMatAuth.instance.currentUser!.nickName,
                      profileImgUrl:
                          InMatAuth.instance.currentUser!.profileImgUrl,
                    )
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

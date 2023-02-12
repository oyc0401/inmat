import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat.dart';
import 'package:inmat/inmat/models/token_model.dart';
import 'package:inmat/utils/inmat_colors.dart';
import 'package:inmat/utils/navigator_context.dart';
import 'package:inmat/utils/toast.dart';
import 'package:provider/provider.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/auth/user.dart';

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
      create: (context) => ProfileViewModel(),
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
              Provider.of<ProfileViewModel>(context).isUser
                  ? UserForm(
                      onclick: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => const ChangeProfile()));
                      },
                      nickName: InmatAuth.instance.currentUser!.nickName,
                      profileImgUrl:
                          InmatAuth.instance.currentUser!.profileImgUrl,
                    )
                  : const LoginButton(),
              Container(
                height: 1.0,
                color: Colors.black,
              ),
              Provider.of<ProfileViewModel>(context).isUser
                  ? MyInformation()
                  : Container(),
              Spacer(),
              Provider.of<ProfileViewModel>(context).isUser
                  ? LogOutButton()
                  : Container(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Colors.orangeAccent,
                  child: const Text("토큰 만료 시키기"),
                  onPressed: () {
                    Token testToken = Token(
                      accessToken:
                          "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmbHV0dGVyMSIsImF1dGgiOiJST0xFX1VTRVIiLCJleHAiOjE2NzUyNTg2Nzd9.cz_hPcfxRmGbxjLAFhus7Q-_GhL5oZ5bSgzecNV95pF82fvTpB_KJ9p-Etnj3IdSMU6U-3iyfASmZUvhBeWdZQ",
                      refreshToken:
                          "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmbHV0dGVyMSIsImF1dGgiOiJST0xFX1VTRVIiLCJleHAiOjE2NzUyNzEyMTd9.Rn_qBBydqgHDeEKvk0__T8iSvUYDrzqgjFEGv2nMF-NSegCNR_-L382zLIJppP0dSh_BIa22WZQlAjy07oJdsg",
                    );
                    Inmat.testInitial(testToken);

                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Colors.purple,
                  child: const Text("context 출력"),
                  onPressed: () {
                    print('context: ${NavigatorContext.context.hashCode}');
                  },
                ),
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
            color: Colorss.primaryColor,
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
            color: Colorss.primaryColor,
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
            color: Colorss.primaryColor,
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
            color: Colorss.primaryColor,
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
          InmatAuth.instance.logout();
          Provider.of<ProfileViewModel>(context, listen: false).logout();
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/inmat/auth/inmat_auth.dart';
import 'package:restaurant/inmat/inMatAPI/inmat_http.dart';
import 'package:restaurant/widget/account/change_profile/change_profile_model.dart';

class ChangeProfile extends StatelessWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("프로필 변경"),),
      body: ChangeNotifierProvider<ChangeProfileModel>(
        create: (context) => ChangeProfileModel(),
        child: Consumer<ChangeProfileModel>(builder: (context, model, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  //Text(Provider.of<ChangeProfileModel>(context).nickname),
                  nicknameField(),
                  CupertinoButton(
                    child: Text("변경"),
                    onPressed: () async {
                      try {
                        await Provider.of<ChangeProfileModel>(context,
                                listen: false)
                            .change();
                      } on ExpirationAccessToken {
                        // 액세스 토큰 만료: 로그아웃 후 다시 로그인
                        print('액세스 토큰 만료');
                      } on AccessDenied {
                        // 접근 권한 없음
                        print('접근 권한 없음');
                      } on OverlappingNickName {
                        // 닉네임 중복 알림
                        print('닉네임 중복');
                      } catch (e) {
                        print(e);
                        // 오류 메세지 알림
                      }
                    },
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class nicknameField extends StatefulWidget {
  const nicknameField({
    Key? key,
  }) : super(key: key);

  @override
  State<nicknameField> createState() => _nicknameFieldState();
}

class _nicknameFieldState extends State<nicknameField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '닉네임',
          style: TextStyle(fontSize: 18),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: InMatAuth.instance.currentUser!.nickName,
          ),
          onChanged: (text) {
            Provider.of<ChangeProfileModel>(context, listen: false)
                .setNickname(text);
          },
        ),
      ],
    );
  }
}

import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin{

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  void login(){
    _handleSignIn();
  }


  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount? account= await _googleSignIn.signIn();
      print(_googleSignIn.currentUser);
      print(account?.email);
      print(account?.id);
      GoogleSignInAuthentication auth=await account!.authentication;
      print(auth.accessToken);
    } catch (error) {
      print(error);
    }
  }

}
void main() {
  // InMatUser.instance.save({
  //   "age": 0,
  //   'gender': "male",
  //   'nickName': "oyc0401",
  //   'profileImgUrl': "www.image.png",
  // });
  //
  // User? user = InMatUser.instance.currentUser;
  //
  // String n = user!.nickName;
  // n = "새거";
  //
  // print(InMatUser.instance.currentUser);
  // print(user);
  Map m1 = {
    "age": 0,
    'gender': "male",
    'nickName': "oyc0401",
    'profileImgUrl': "www.image.png",
  };

  Map m2 = {
    "age": 40,
  };

  m1.addAll(m2);

  print(m1);

  // InMatUser._save(user1);
}

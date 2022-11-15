class InUser {
  InUser(this.name, this.id);

  factory InUser.instance(String name, int id) {
    return InUser(name, id);
  }

  String name = "null";
  int id = 0;
}

void main() {
  InUser inUser = InUser.instance("111", 1);

  //inUser.name = "하이";
  InUser inUser2 = InUser.instance("111", 1);
  print(inUser == inUser2);
}

class InUser {
  InUser();

  factory InUser.instance() {
    return InUser();
  }

  String name = "null";
  int id = 0;
}

void main() {
  InUser inUser = InUser.instance();

  inUser.name = "하이";
  InUser inUser2 = InUser.instance();
  print(inUser2.name);
}

class Alphabet {
  static String name = "하이";

  getName() {
    return name;
  }

  setName(String n){
    name=n;
  }
}

class A extends Alphabet {}

class B extends Alphabet {}

void main() {
  bool match = RegExp(
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$")
      .hasMatch('oyc0877&');

  print(match);

}

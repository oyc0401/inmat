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
  A a = A();
  B b = B();

  print(a.getName());
  print(b.getName());
  print('');

  a.setName("111");
  print(a.getName());
  print(b.getName());
  print('');

  b.setName("222");
  print(a.getName());
  print(b.getName());
  print('');


}

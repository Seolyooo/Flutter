/*
  날짜 : 2025/10/23
  이름 : 설유진
  내용 : Dart 상속
*/

class Animal{
  String _name;
  Animal (this._name);
  void speak(){
    print('speak $_name');

  }

  void move(){
    print('move $_name');
  }

}

class Dog extends Animal{
  String _breed;
  Dog(String name, this._breed ) : super(name);

  @override
  void speak(){
    print('$_name($_breed) 멍멍');
  }

  void walk(){
    print('$_name($_breed)  산택중');
  }
}

class Cat extends Animal{
  String _breed;
  Cat(String name, this._breed ) : super(name);

  @override
  void speak(){
    print('$_name($_breed) 냥냥');
  }

  void walk(){
    print('$_name($_breed)  타워 오르는중');
  }
}

void main(){

  //Animal 생성
  Animal animal = new Animal('동물');
  animal.speak();
  animal.move();

  //dog
  Dog myDog = new Dog('멍멍이', '푸들');
  myDog.speak();
  myDog.walk();

  //cat
  Cat myCat = new Cat('나비', '샴');
  myCat.speak();
  myCat.walk();


  //다형성
  Animal a1 = Dog('바둑이', '진돗개');
  Animal a2 = Cat('야옹이', '고양이');

  a1.speak();
  a2.speak();

  if(a1 is Dog){
    a1.walk();
  }

  if(a2 is Cat){
    a2.walk();
  }




}

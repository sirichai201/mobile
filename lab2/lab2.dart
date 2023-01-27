const num pi = 3.141;
int getAge() => 20;
void main() {
  var myAge = getAge;
  print(myAge());

  profile('ssss', 'skr');
  profile('ddddd');
  profile2(name: 'xxx', city: 'bkk');
  profile2(city: 'bkk', name: 'xxxx');
}

void profile(String name, [String city = 'bkk']) {
  print('your name: $name, city:$city');
}

void profile2({String name = '', String city = ''}) {
  print('your name: $name, city:$city');
}

void func1() {
  print('function 1');
}

func1_2() => print('function1_2');
void func2(int param1, String param2) {
  print('param1 = $param1, param2 =$param2');
}

bool func3() {
  return true;
}

bool func2_3() => true;

String func4(int param1, String param2) {
  return 'param1 = $param1, param2 =$param2';
}

import 'Product.dart';
import 'furniture.dart';

void main(List<String> args) {
  furniture fur1 = new furniture('furl1', 88);
  fur1.setAmount(3);
  fur1.show();
  print('จำนวน' + fur1.getAmount().toString());
  fur1.show2(5);

  Product product1 = new Product('Mobile', 999);
  product1.show();
  //print(product1.getName());
  Product Product2 = new Product('com', 888);
  Product2.show();
  //print(Product2.getName());
  //print(product1.name);
  //product1.setName('mobile');

  // print(product1.price);
  // product1.show();

  //List list1 = ['string', 123, 8.8, false];
  //print(list1[0]);
  //print(list1.length);
  //print(list1[list1.length - 1]);
  //list1.add('product');
  // print(list1);
  //list1[0] = true;
  //print(list1);
  //for (var i = 0; i < list1.length; i++) print(list1[i]);
  //for (var item in list1) print(item);
  //list1.insert(5, 777);
  //list1.remove('product');
  //print(list1);
  //Map<int, dynamic> conv = list1.asMap();

  //Map<int, String> code = {1122: 'not Found', 200: 'ok'};
  //print(code);
  //print(code[1122]);
  //code[500] = 'Server Error';
  //print(code);
  //code.remove(1122);
  //print(code);
  // print(code.keys.toList());
  // print(code.values.toList());
}

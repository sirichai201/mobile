class Product {
  late String _name;
  double? _price;

  // Product(String name, double price) {
  //print('product construction');
  //this._name = name;
  //this._price = price;
  //}
  Product(this._name, this._price);

  void show() {
    print('สินค้า ${this._name} ราคา ${this._price}');
  }
  //void show() {
  //print('สินค้า$name ราคา$price');
  //}

  //void show2() => print('สินค้า$name ราคา$price');

  void setName(String name) {
    this._name = name;
  }

  String getName() {
    return this._name;
  }
}

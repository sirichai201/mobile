import 'Product.dart';

class furniture extends Product {
  furniture(super.name, super.price);

  int _amount = 0;
  getAmount() => this._amount;
  setAmount(int amount) => this._amount = amount;

  void show2(int i, [String? name]) {
    print('สินค้า');
  }
}

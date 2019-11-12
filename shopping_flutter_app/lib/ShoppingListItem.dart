import 'package:flutter/material.dart';

class Product {
  const Product({this.name});

  final String name;
}

/*
*  key 在Widget State 中都时默认构造函数的参数
*  runtimeType
* */
typedef void CartChangedCallback(Product product, bool inCart);

//不可变组件StatelessWidget
class ShoppingListItem extends StatelessWidget {
  //回调函数
  final CartChangedCallback onCartChanged;
  final bool inCart;
  final Product product;

  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      //响应点击
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

/*
*  可变组件StatefulWidget
*  StatefulWidget 调用createState()方法之后，将state插入树种，调用对象的initState()初始化方法 执行初始化
*  当状态对象不需要时调用dispose,清理状态
* */
class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);

  @override
  _ShoppingListState createState() {
    // TODO: implement createState

    return new _ShoppingListState();
  }
}

//命名State子类时带一个下划线，这表示其是私有的
class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  //
  //初始化工作
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Shopping List"),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: "Shopping App",
    home: new ShoppingList(
      products: <Product>[
        new Product(name: 'Eggs'),
        new Product(name: 'Flour'),
        new Product(name: 'Apple'),
        new Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}

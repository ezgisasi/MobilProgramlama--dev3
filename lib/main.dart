import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? selectedProductIndex;

  final List<Product> products = [
    Product(name: "iPhone", description: "iPhone is the stylish phone ever", price: 1000, image: "assets/images/iphone.png"),
    Product(name: "Pixel", description: "Pixel is the most featureful phone ever", price: 800, image: "assets/images/pixel.png"),
    Product(name: "Laptop", description: "Laptop is the most productive development tool", price: 2000, image: "assets/images/laptop.png"),
    Product(name: "Tablet", description: "Tablet is the most useful device ever for meetings", price: 1500, image: "assets/images/tablet.png"),
    Product(name: "Pendrive", description: "Pendrive is a useful storage medium", price: 100, image: "assets/images/pendrive.png"),
    Product(name: "Floppy Drive", description: "Floppy drive is a useful rescue storage medium", price: 20, image: "assets/images/floppy.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProductIndex = index;
                    });
                  },
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(8),
                    child: Card(
                      color: selectedProductIndex == index ? Colors.blueAccent : Colors.white,
                      child: Center(child: Text(products[index].name)),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProductIndex = index;
                    });
                  },
                  child: Card(
                    color: selectedProductIndex == index ? Colors.blueAccent : Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(products[index].image),
                        Text(products[index].name, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Price: \$${products[index].price}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product({required this.name, required this.description, required this.price, required this.image});
}

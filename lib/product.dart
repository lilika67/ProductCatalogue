import 'package:flutter/material.dart';

// Product class to define product details
class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

// Sample list of products
final List<Product> products = [
  Product(name: 'cabbage', imageUrl: 'https://d3awvtnmmsvyot.cloudfront.net/api/file/GGosbWO9SYyGxvDaciZf/convert?fit=max&w=570&cache=true', price: 400),
  Product(name: 'tomatoes', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8Da6sduPCtZTFk0ZkO8LbL637SA0KKJSgNA&s', price: 699),
  Product(name: 'Green pepper', imageUrl: 'https://i0.wp.com/foodieng.com/wp-content/uploads/2022/05/green-pepper.jpg?fit=720%2C810&ssl=1', price: 500),
  Product(name: 'red pepper', imageUrl: 'https://images.immediate.co.uk/production/volatile/sites/30/2020/02/Red-peppers-afa27f8.jpg?resize=768,574', price: 200),
];

// ProductCard widget class
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show dialog with product name when tapped
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(product.name),
            content: Text('Price: \$${product.price}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500), // Animation duration
        curve: Curves.easeInOut,
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('\$${product.price}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

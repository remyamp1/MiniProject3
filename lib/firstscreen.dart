import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/WishList.dart';
import 'package:hive_app/database.dart';
import 'package:hive_app/descreption.dart';

class ScreenFirst extends StatefulWidget {
  @override
  State<ScreenFirst> createState() => _ScreenFirstState();
}

class _ScreenFirstState extends State<ScreenFirst> {
  List<Map<String, String>> wishlistItems = [];

  void addToWishlish(Map<String, String> item) {
    setState(() {
      if (wishlistItems.contains(item)) {
        wishlistItems.remove(item);
      } else {
        wishlistItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.arrow_back),
            title: Center(
                child: Text(
              'SWEATSHIRT',
              style: TextStyle(fontSize: 20),
            )),
            actions: [
              Icon(Icons.shopping_bag),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WishList(wishlistItems: wishlistItems)));
                  },
                  child: Icon(Icons.favorite))
            ],
            backgroundColor: const Color.fromARGB(255, 178, 219, 253)),
        body: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text('Search'),
                    Spacer(),
                    Text('Filter'),
                    SizedBox(width: 10),
                    Text('Sort')
                  ],
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 7,
                mainAxisSpacing: 15,
              ),
              itemCount: Database.MyList.length,
              itemBuilder: (context, index) {
                final product = Database.MyList[index];
                bool isInWishlist = wishlistItems.contains(product);
                return Container(
                  height: 800,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 245, 239, 241),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(product['image']!))),
                          child: GestureDetector(onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Example(
                                        imagepath: product['image']!,
                                        name: product['name']!,
                                        price: product['price']!)));
                          }),
                        ),
                        Text(product['name'] ?? ""),
                        Text(product['name1'] ?? ""),
                        Row(
                          children: [
                            Icon(Icons.currency_rupee),
                            Text(product['price'] ?? ""),
                            Spacer(),
                            GestureDetector(
                              onTap: () => addToWishlish(product),
                              child: Icon(Icons.favorite,
                                  color:
                                      isInWishlist ? Colors.red : Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ));
  }
}

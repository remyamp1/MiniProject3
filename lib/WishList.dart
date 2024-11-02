import 'package:flutter/material.dart';
import 'package:hive_app/cart.dart';

class WishList extends StatelessWidget{
   final List<Map<String,String>> wishlistItems;


  WishList({required this.wishlistItems});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(
        "WishList",style: TextStyle(fontSize: 25),
      ),backgroundColor: const Color.fromARGB(255, 178, 219, 253),
      actions: [
        Icon(Icons.shopping_cart)
      ],
      ),
      body:ListView.builder(
        itemCount: wishlistItems.length,
        scrollDirection: Axis.vertical,
      itemBuilder: (context,index){
return ListTile(
  leading:  Image(image: AssetImage(wishlistItems[index]['image']!),),
  title: Text(wishlistItems[index]['name']!),
  subtitle:  Text(wishlistItems[index]['price']!),
  trailing: 
       ElevatedButton(
                 onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartexample(
                        imagepath:wishlistItems[index]['image']!,
                        name:wishlistItems[index]['name']!,
                         price:wishlistItems[index]['price']!)));
                                            
                            },style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                            child: Text("Add to Cart",style: TextStyle(color: Colors.white),)),
                        );
                   
      })           
            
    );
  }
}
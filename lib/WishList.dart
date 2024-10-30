import 'package:flutter/material.dart';
import 'package:hive_app/cart.dart';

class WishList extends StatelessWidget{
   final String imagepath;
  final String name;
  final String price;

  WishList({required this.imagepath,required this.name,required this.price});
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
        itemCount: 1,
      itemBuilder: (context,index){
return ListTile(
  leading:  Image.asset(imagepath),
  title: Text(name),
  subtitle:  Text(price,style: TextStyle(fontSize: 15),),
  trailing: 
       ElevatedButton(
                 onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartexample(
                        imagepath: imagepath,
                        name: name,
                         price:price)));
                                            
                            },style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                            child: Text("Add to Cart",style: TextStyle(color: Colors.white),)),
                        );
                   
      })           
            
    );
  }
}
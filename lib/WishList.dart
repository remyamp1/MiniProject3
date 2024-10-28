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
      ),backgroundColor: const Color.fromARGB(255, 178, 219, 253),),
      body:Container(
        decoration: BoxDecoration(image:
         DecorationImage(image: AssetImage("assets/image/backgroun.jpeg"),
        fit: BoxFit.cover)),
      child:  Column(
         children: [
           Container(
            height: 100,
            width: double.infinity,
               color: const Color.fromARGB(255, 252, 246, 246),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                   child: Image.asset(imagepath),
                  ),
                ),
                
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Text(name),
                 ),
               ]
                  ),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                 Icon(Icons.currency_rupee,size: 20,),
                 Text(price,style: TextStyle(fontSize: 15),),
                 SizedBox(width: 5,), 
                  Text("  9% off",style: TextStyle(fontSize: 10,color: const Color.fromARGB(255, 110, 108, 108)),)
               
               ],
             ),
              ],
               ),
           ],
            ),
             ),
                  SizedBox(height: 70,),
                
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)
                        ,color: const Color.fromARGB(255, 245, 85, 138),),
                        child: GestureDetector(
                          onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartexample(
                      imagepath: imagepath,
                      name: name,
                       price:price)));
                    
                          },
                          child: Text("Add to Cart",style: TextStyle(color: Colors.white),)),
                      )
                    
         ],
       ),
      
      


      
      
        
        
      )  
        
    );
  }
}
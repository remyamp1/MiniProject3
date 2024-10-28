import 'package:flutter/material.dart';
import 'package:hive_app/cart.dart';
import 'package:hive_app/database.dart';


class Example extends StatelessWidget {
  final String imagepath;
  final String name;
  final String price;

  Example ({required this.imagepath,required this.name,required this.price});
  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/backgroun.jpeg"),
        fit: BoxFit.cover)),
    child:   Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagepath),
            fit: BoxFit.cover)),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(name,style: TextStyle(fontSize: 20),),
              ]),
          ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.currency_rupee),
                  Text(price,style: TextStyle(fontSize: 15),),
                  Spacer(),
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star,color: Colors.yellow,),
                  Icon(Icons.star,color: const Color.fromARGB(255, 175, 173, 173),),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(''' Style is a way to say who you are without
     having to speak try motor crest crew.''',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartexample(
                      imagepath: imagepath,
                      name: name,
                       price:price)));
                    },child: 
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Add to Cart",style: TextStyle(fontSize: 15,
                      color: Colors.pink),),
                    ),),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(onPressed: (){},child: Text(
                      "Buy Now"
                    )),
                  )
                  
                ],
              )
    
            ],
          ),
          
        
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/firstscreen.dart';
class LoginExample extends StatefulWidget {
  const LoginExample({super.key});

  @override
  State<LoginExample> createState() => _LoginExampleState();
}

class _LoginExampleState extends State<LoginExample> {
   TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
    late Box box;
        String _loginmassage='';

  @override
  void initState(){
    super.initState();
    box=Hive.box('mybox');

  }

  void _login(){
    setState(() {
      String storedusername=box.get('username');
      String storedpassword=box.get('password');
      if(storedusername==usernameController.text &&
      storedpassword==passwordController.text){
        _loginmassage='Login Successful';
      }
      else{
        _loginmassage='invalid Credentials';
      }
      
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/backgroun.jpeg"),
        fit: BoxFit.cover)),
    child:   Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
           
              SizedBox(height: 10),

              TextFormField(
               controller: usernameController,
                decoration: InputDecoration(border: OutlineInputBorder(),label:Text("Username"),),),
              SizedBox(height: 20),
              
          
              SizedBox(height: 10),

              TextFormField(
           controller: passwordController,
                decoration: InputDecoration(border: OutlineInputBorder(),label:Text("Password"),),),
              SizedBox(height: 80),
              ElevatedButton(onPressed: (){
 Navigator.push(context,
      MaterialPageRoute(builder: (context)=>ScreenFirst()));
                _login();
              }, style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 153, 151, 250),),
               child: Text("Login")),
              Text( _loginmassage)
            ],
          ),
        ),
      ),
      )
    );
  }
}
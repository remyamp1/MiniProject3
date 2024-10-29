
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/firstscreen.dart';
class LoginExample extends StatefulWidget {
  const LoginExample({super.key});

  @override
  State<LoginExample> createState() => _LoginExampleState();
}

class _LoginExampleState extends State<LoginExample> {
   late Box box;
   TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   
        String _loginmassage='';

 
  void initState(){
    super.initState();
    box=Hive.box('mybox');

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
             
                SizedBox(height: 10),
      
                TextFormField(
                 controller: usernameController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label:Text("Username"),),
                  onChanged: (text){
                    setState(() {
                      _loginmassage='';
                    });
                  }),
            
                
            
                SizedBox(height: 10),
      
                TextFormField(
             controller: passwordController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label:Text("Password"),),
                  onChanged: (text) {
                    setState(() {
                      _loginmassage='';
                    });
                  },
                  ),
            
                SizedBox(height: 80),
          
                ElevatedButton(onPressed: (){
                  List<dynamic> usersListDynamic=box.get('itemsList',
                  defaultValue: []);
                  List<Map<String,String>> usersList=usersListDynamic.map((e)=>Map<String,String>.from(e as Map)).toList();
                  bool userFound=false;
                  bool passwordCorrect=false;
                  for (var user in usersList){
                    if
                    (user[ 'fullname']==passwordController.text){
                      userFound=true;
                      if
                      (user[ 'password']== passwordController.text){
                        passwordCorrect=true;
                        break;
                      }
                    }
                  }
                  if (userFound && passwordCorrect){
                    setState(() {
                      _loginmassage='Login successful';
                    });
                  
                  
       Navigator.push(context,
        MaterialPageRoute(builder: (context)=>ScreenFirst()));

        usernameController.clear();
        passwordController.clear();
      
                 }
                 else if 
                 (userFound){
                  setState(() {
                    _loginmassage='Incorrect password.';
                  });
                  
                 } else{
                  setState(() {
                    _loginmassage='Username not fount.';
                  });
                 }
              
                  }, style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 153, 151, 250),),
                 child: Text("Login")),
                Text( _loginmassage)
              ],
            ),
          ),
    ),
    );
  }
}
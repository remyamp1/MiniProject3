import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/login.dart';
class RegistrationExample extends StatefulWidget {
  const RegistrationExample({super.key});

  @override
  State<RegistrationExample> createState() => _RegistrationExampleState();
}

class _RegistrationExampleState extends State<RegistrationExample> {
late Box box;

  TextEditingController fullnameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
 TextEditingController phonenoController=TextEditingController();
TextEditingController createController=TextEditingController();
   List<Map<String,String>> itemsList=[];
   String _registrationmessage='';
  @override
  void initState(){
    super.initState();
    box=Hive.box('mybox');
     

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child:
        Padding(
         padding: const EdgeInsets.all(20.0),
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text("CREATE NEW ACCOUNT",style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 211, 151, 250)),),
           SizedBox(height: 30),
               TextFormField(
                  controller: fullnameController,
                 decoration: InputDecoration(border: OutlineInputBorder(),label: Text('FullName')),),
                
           
               
               SizedBox(height: 20),
           
               TextFormField(
                 controller: emailController,
                 decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Email")),),
                 SizedBox(height: 20),
           
                 TextFormField(
                  controller: passwordController,
                 decoration: InputDecoration(border: OutlineInputBorder(),label: Text('Password')),),
           SizedBox(height: 20),
           
            TextFormField(
                  controller: confirmpasswordController,
                 decoration: InputDecoration(border: OutlineInputBorder(),label: Text('ConfirmPassword')),),
             
               SizedBox(height: 20),
           
               TextFormField(
                  controller: phonenoController,
                 decoration: InputDecoration(border: OutlineInputBorder(),label: Text('Phone Number')),),
            SizedBox(height: 80),
               SizedBox(height: 40,
               width: 250,
                 child: ElevatedButton(onPressed: (){},
                 style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 211, 151, 250),shape: RoundedRectangleBorder()),
                  
                   child: GestureDetector(
                     onTap: () {
                       setState(() {
                         if (fullnameController.text.isEmpty ||
                         emailController.text.isEmpty ||
                         passwordController.text.isEmpty ||
                         confirmpasswordController.text.isEmpty ||
                         phonenoController.text.isEmpty){
                        _registrationmessage='All fields are required';
                         return;
                         }
            if(passwordController.text !=confirmpasswordController.text){
             _registrationmessage='Password do not match';
             return;
            }             
                  itemsList.add({
                   'fullname':fullnameController.text,
                   'email':emailController.text,
                   'password':passwordController.text,
                   'confirm':confirmpasswordController.text,
                   'Phno':phonenoController.text
                  });   
                    box.put(
               'itemsList',
                itemsList.map((e)=>Map<String,dynamic>.from(e)
               ).toList(),
               );
               fullnameController.clear();
               emailController.clear();
               passwordController.clear();
               confirmpasswordController.clear();
      
               _registrationmessage="Registration Successful";
                       
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginExample()));
                     });
                     print('Registered Items:$itemsList');
                     },
                     
                     child: Text("Create an Account",style: TextStyle(fontSize: 20))),
                 
                 ),
               
               ),
               SizedBox(height: 40),
           Text('$_registrationmessage'),
               Row(
                 
                 children: [
                   Text("Already have an Account?"),
                   SizedBox(width: 10),
                   ElevatedButton(onPressed: (){
                           GestureDetector(
                             onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginExample()));
                             },
                           );    
                     
                     
                      },
                       style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 211, 151, 250),shape: RoundedRectangleBorder()),
                       child: GestureDetector(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginExample()));
                         },
                         child: Text("Login"))),
                 ],
               )
             ],
           ),
         ),
       ),
            ),
    );
  }
}
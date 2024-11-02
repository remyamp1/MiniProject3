import 'package:flutter/material.dart';
import 'package:hive_app/database.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController cartNocontroller = TextEditingController();
  TextEditingController vaildcontroller = TextEditingController();
  TextEditingController cvvcontoller = TextEditingController();


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: const Color.fromARGB(255, 239, 247, 253),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Total Amount'),
                      Icon(Icons.arrow_drop_down_sharp),
                      Spacer(),
                      Icon(Icons.currency_rupee),
                      Text(' '),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.indeterminate_check_box),
                      SizedBox(width: 5),
                      Text(
                        'Credit/Debit/ATM Card',
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_drop_up)
                    ],
                  ),
                  Text(
                      'Note:Please ensure your card can be used for online transaction.')
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 248, 242, 242)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Card Number'),
                      SizedBox(height: 5),
                      SizedBox(
                          height: 40,
                          child: TextField(
                            controller: cartNocontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          )),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Valid Thru'),
                          SizedBox(
                            width: 140,
                          ),
                          Text('CVV')
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(
                              height: 40,
                              width: 100,
                              child: TextField(
                                  controller: vaildcontroller,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('MM/YY')))),
                          Spacer(),
                          SizedBox(
                              height: 40,
                              width: 100,
                              child: TextField(
                                controller: cvvcontoller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text('CVV')),
                              )),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        color: Colors.yellow,
                        child: Row(
                          children: [
                            Center(child: Text('Pay')),
                            Icon(
                              Icons.currency_rupee,
                              size: 15,
                            ),
                            Text(' ')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 35),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.percent),
                      SizedBox(width: 8),
                      Text("EMI"),
                      Spacer(),
                      Icon(Icons.arrow_drop_down_sharp)
                    ],
                  ),
                  Text(
                    'Get Debit and Cardless EMIs on HDFC Bank',
                    style: TextStyle(color: Colors.green),
                  ),
                  Text('__________________________________________________'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.home),
                      SizedBox(width: 8),
                      Text('Net Banking'),
                      Spacer(),
                      Icon(Icons.arrow_drop_down_sharp)
                    ],
                  ),
                  Text('__________________________________________________'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.wallet),
                      SizedBox(width: 8),
                      Text('Wallets'),
                      Spacer(),
                      Icon(Icons.arrow_drop_down_sharp)
                    ],
                  ),
                  Text('__________________________________________________'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.check_box),
                      SizedBox(width: 8),
                      Text('UPI'),
                      Spacer(),
                      Icon(Icons.arrow_drop_down_sharp)
                    ],
                  ),
                  Text(
                    'Pay by any UPI app',
                    style: TextStyle(color: Colors.green),
                  ),
                  Text('__________________________________________________'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        size: 15,
                      ),
                      SizedBox(width: 8),
                      Text('Cash on Delivery'),
                      Spacer(),
                      Icon(Icons.arrow_drop_down_sharp)
                    ],
                  ),
                  Text('__________________________________________________'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.gif_box),
                      SizedBox(width: 8),
                      Text('Have a Flipkart Gift Card?'),
                      Spacer(),
                      Text(
                        'Add',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  Text('__________________________________________________'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

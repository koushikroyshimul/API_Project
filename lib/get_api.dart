import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_project/get_data_model.dart';

import 'insert_api.dart';

class Get_api extends StatefulWidget {
  const Get_api({Key? key}) : super(key: key);

  @override
  State<Get_api> createState() => _Get_apiState();
}

class _Get_apiState extends State<Get_api> {
  String name = "";
  String roll = "";
  String marks = "";

  late GetApi getApi;
  get_api() async {
    final response = await http.get(Uri.parse('https://flutterapi.brotherdev.com/get_api.php'));

    getApi = getApiFromJson(response.body);

    setState(() {
      name = getApi.name;
      roll = getApi.roll;
      marks = getApi.marks;
    });
  }

  @override
  void initState() {
    super.initState();
    get_api();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Image.asset(
                'assets/B_T.png', // Change the path to your logo image
                fit: BoxFit.contain,
                height: 35,
              ),
              SizedBox(width: 1), // Adjust the spacing between logo and title
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Bangladesh Army International University of Science and Technology",
                      style: TextStyle(fontSize: 7.5,fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Center(
                    child: Text(
                      "(BAIUST)",
                      style: TextStyle(fontSize: 7.5,fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              Image.asset(
                'assets/A_T.png', // Change the path to your logo image
                fit: BoxFit.contain,
                height: 35,
              ),
            ],
          ),
        ),
        body:  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Your Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 45,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                height: 400,
                width: 340,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Name: $name',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'ID: $roll',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    Text(
                      'Obtained Marks',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '$marks',
                      style: TextStyle(color: Colors.black, fontSize: 85, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Insert_api())); // Corrected line
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

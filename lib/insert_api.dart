import 'dart:convert';
import 'package:flutter/material.dart';
import 'get_api.dart';
import 'package:http/http.dart' as http;

class Insert_api extends StatefulWidget {
  const Insert_api({Key? key}) : super(key: key);

  @override
  State<Insert_api> createState() => _Insert_apiState();
}

class _Insert_apiState extends State<Insert_api> {
  TextEditingController name = TextEditingController();
  TextEditingController roll = TextEditingController();
  TextEditingController marks = TextEditingController();


  insert_api() async {
    final response = await http.post(
      Uri.parse('https://flutterapi.brotherdev.com/post_insert_api.php'),
      body: jsonEncode(<String, dynamic>{
        "name": name.text,
        "roll": roll.text,
        "marks": marks.text
      }),
    );
    print(response.body);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius:80,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('assets/12.jpg'),
                      height: 180,
                      width:180,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Text('Koushik Roy', style: TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),),
              Text('Intern Software Engineer',style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold), ),
              SizedBox(height: 15,),
              TextFormField(
                controller: name,
                maxLength: 50, // Maximum character length
                decoration: InputDecoration(
                  labelText: 'Name',
                  counterText: '', // Empty string to hide the default counter
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: roll,
                maxLength: 10, // Maximum character length
                decoration: InputDecoration(
                  labelText: 'Roll',
                  counterText: '', // Empty string to hide the default counter
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: marks,
                maxLength: 3, // Maximum character length
                keyboardType: TextInputType.number, // To restrict input to numbers only
                decoration: InputDecoration(
                  labelText: 'Marks',
                  counterText: '', // Empty string to hide the default counter
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),

              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        insert_api();
                      },

                      child: Text('Submit'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Get_api())); // Corrected line
                      },
                      child: Text('Result'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class Bmi extends StatefulWidget {

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
 var _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            new TextField(
              keyboardType: TextInputType.number,
            controller: _heightController ,
            decoration: new InputDecoration(
              labelText: 'height in cm',
              icon: new Icon(Icons.trending_up),
            ),
            ),
            SizedBox(
              height: 20,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              controller: _weightController ,
              decoration : new InputDecoration(
                labelText: 'weight in  kg ',
                icon: new Icon(Icons.line_weight  ),
              ),
            ),
            SizedBox(
              height: 15 ,
            ),
            ElevatedButton(
                onPressed: CalculateBmi,
                child: new Text('Calculator',
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),
            SizedBox(
              height: 15 ,
            ),
            Text(
              _result == null ? 'enter value':"${_result.toStringAsFixed(2)}",
              style: new TextStyle(
                color: Colors.green,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
void CalculateBmi(){
    double height = double.parse(_heightController.text)/100;
    double weight = double.parse(_weightController.text);
    double heightsquare = height*height;
    double result = weight/heightsquare;
     _result = result;
    setState(() {
    });
  }
}
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: Bmi(),
    );
  }
}



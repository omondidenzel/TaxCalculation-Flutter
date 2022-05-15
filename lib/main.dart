import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Futter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: MyTax(),
      routes: {'/second': (_) => TaxPage()},
    );
  }
}

class MyTax extends StatelessWidget {
  const MyTax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          leading: Icon(Icons.rounded_corner),
          title: Text("Tax"),
        ),
        body: Center(child: RaisedButton(onPressed: (){
          Navigator.of(context).pushNamed('/second');
        },child: Text("Tax Page"),),
        ),
      ),
    );
  }
}

class TaxPage extends StatefulWidget {
  const TaxPage({Key? key}) : super(key: key);

  @override
  State<TaxPage> createState() => _TaxPageState();
}

class _TaxPageState extends State<TaxPage> {
  double title = 0;
  double text = 0;


  void _setText(){
    setState((){
      text =  title;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Tax'),
      ),

      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 10.0,),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter Gross salary",),

          onChanged: (value) => text,
        ),

      RaisedButton(onPressed: () {
        _setText();
      },child: Text("Calculate Tax")),
           SizedBox(height: 50.0,),
           Text("$text",
             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,
                 color: Colors.blue[900]),)
      ],

    ),
    ),
    );
  }
}




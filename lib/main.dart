import 'package:flutter/material.dart';
import 'package:jrup/changer.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<Changer>(
        //create: (_),
        child: MyHomePage(title: 'Testing Provider class'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, double> dataMap;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    dataMap = {
      'Flutter': 5.0,
      'React': 3.0,
      'Xamarin': 2.0,
      'Ionic': 2.0,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
            ),

            //slider
            Slider(
              value: 200.0,
              activeColor: Colors.blue,
              min: 100.0,
              max: 900.0,
              divisions: 8,
              onChanged: (val) => print(val),
            ),
          ],
        ),
      ),
    );
  }
}

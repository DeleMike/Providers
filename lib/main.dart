import 'package:flutter/material.dart';
import 'package:jrup/changer.dart';
import 'package:jrup/screen_two.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Changer>(
      create: (context) => Changer(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Testing Provider class'),
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
   var showChart = false;

  @override
  Widget build(BuildContext context) {
    print('widget rebuild');

    //final changer = Provider.of<Changer>(context, listen: false);
   

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Changer>(
              builder: (_, changer, __) => Visibility(
                // maintainSize: true,
                // maintainAnimation: true,
                // maintainState: true,
                visible: changer.isVisible,
                child: PieChart(
                  dataMap: {
                    'Flutter':( changer.value / 90.0),
                    'React': (changer.value / 100.0),
                    'Xamarin': 4.6,
                    'Ionic': 1.9,
                  },
                  animationDuration: Duration(milliseconds: 1000),
                ),
              ),
            ),

            //slider
            Consumer<Changer>(
              builder: (_, changer, __) => Visibility(
                visible: changer.isVisible,
                // maintainSize: true,
                // maintainAnimation: true,
                // maintainState: true,
                child: Slider(
                  value: changer.value,
                  activeColor: Colors.blue,
                  min: 100.0,
                  max: 900.0,
                  //divisions: 8,
                  onChanged: (val) {
                    changer.increment(val);
                    print(changer.value);
                  },
                ),
              ),
            ),

            //button
            Consumer<Changer>(
              builder: (_, changer, __ ) =>
                        ElevatedButton(
                  child: Text('pie chart'),
                  onPressed: () {

                    changer.changeVisibility();
                    print('ShowChart: ${changer.isVisible}');
                    // setState(() {
                    //   showChart = !showChart;
                    //   print('ShowChart: $showChart');
                    // });

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ScreenTwo()),
                    // );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

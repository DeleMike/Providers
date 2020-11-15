import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('widget rebuild');
    //final changer = Provider.of<Changer>(context, listen: false);
   
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ValueNotifier<double>>(
              builder: (_, changer, __) => PieChart(
                dataMap: {
                  'Flutter': (changer.value / 100.0),
                  'React': 5.9,
                  'Xamarin': 2.3,
                  'Ionic': 1.7,
                },
                animationDuration: Duration(milliseconds: 1000),
              ),
            ),

            //slider
            Consumer<ValueNotifier<double>>(
              builder: (_, changer, __) => Slider(
                value: changer.value,
                activeColor: Colors.blue,
                min: 100.0,
                max: 900.0,
                //divisions: 8,
                onChanged: (val) {
                  changer.value = val;
                  print(changer.value);
                },
              ),
            ),

            //button
            ElevatedButton(
              child: Text('Go back'),
              onPressed: () {
                  Navigator.pop(context);
              }
            ),
          ],
        ),
      ),
    );
  }
}
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
           appBar: AppBar(
             title: Text('Slider Seekbar in Flutter')
             ),
            body: Center(
              child: SliderWidget()
              )
            )
          );
  }
}
 
class SliderWidget extends StatefulWidget {
  @override
  SiderWidgetState createState() => new SiderWidgetState();
}
 
class SiderWidgetState extends State{
 
  int valueHolder = 20;
      
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Slider(
              value: valueHolder.toDouble(),
              min: 1,
              max: 100,
              divisions: 100,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              label: '${valueHolder.round()}',
              onChanged: (double newValue) {
                setState(() {
                  valueHolder = newValue.round();
                });
              },
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()}';
              }
          )),
      Text('$valueHolder', style: TextStyle(fontSize: 22),)
 
    ]
  ));
  }
}

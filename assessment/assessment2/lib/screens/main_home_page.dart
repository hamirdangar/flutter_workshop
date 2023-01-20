//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../componets/my_container.dart';
import 'home_page_card/about_rajkot.dart';
import 'home_page_card/historical_places.dart';
import 'home_page_card/places_to_see_around.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /*final List cardtitle = [
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
    'Historical Places',
  ];

  final List cardlogo = [
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
    'lib/images/historical_places.png',
  ];

  final List ontap = [
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
    MyListTile(title: 'Historical Places'),
  ];

  final List cardColor = [
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
      Colors.greenAccent,
  ];
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
         title: Text('Travel Guidance'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10
            ),
          children: [
                MyContainer(
                text: 'Historical Places',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/historical_places.png',
              ),
                MyContainer(
                text: 'About Rajkot',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutRajkot(title: 'About Rajkot'),));
                  },
                logo: 'lib/images/about_rajkot.png',
              ),
                MyContainer(
                text: 'How To Reach',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/how_to.png',
              ),
                MyContainer(
                text: 'Rajkot In Map',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/map.png',
              ),
                MyContainer(
                text: 'Devitional Places',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/devotional.png',
              ),
                MyContainer(
                text: 'Amusement Parks',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/amusement.png',
              ),
                MyContainer(
                text: 'Dams/Lake',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/dams.png',
              ),
                MyContainer(
                text: 'Other Places',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/othear_places.png',
              ),
                MyContainer(
                text: 'Places To See Around',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlacesToSeeAround(title: 'Places To See Around'),));
                  },
                logo: 'lib/images/places_to_see.png',
              ),
                MyContainer(
                text: 'Cinemas',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/cinemas.png',
              ),
                MyContainer(
                text: 'Hotels',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/hotels.png',
              ),
                MyContainer(
                text: 'Malls',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/malls.png',
              ),
                MyContainer(
                text: 'Travel Guide',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/travel.png',
              ),
                MyContainer(
                text: 'Distences',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/distences.png',
              ),
                MyContainer(
                text: 'Developer',
                color: Colors.blue,
                onTab: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaces(title: 'Historical Places'),));
                  },
                logo: 'lib/images/developer.png',
              ),
          ],
        ),
      ),
    );
  }
}

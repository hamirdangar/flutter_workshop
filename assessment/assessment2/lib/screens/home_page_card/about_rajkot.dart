
//@dart=2.9
import 'package:flutter/material.dart';

import '../../componets/list_tile_details_page.dart';

class AboutRajkot extends StatelessWidget {
  final String title;
  final void Function() onTap;
  AboutRajkot({Key key, this.title, this.onTap}) : super(key: key);

  final List list = [
    'History of Rajkot',
    'Tourism in Rajkot',
    'Economy and Industry in Rajkot',
    'Art and Handicrafts of Rajkot',
    'People and Culture of Rajkot',
    'Jubilee Garden',
    'RK University',
  ];

  final List imagelist = [
    'https://im.hunt.in/cg/Rajkot/City-Guide/About-3.jpg',
    'https://im.hunt.in/cg/Rajkot/City-Guide/About-2.jpg',
    'https://im.hunt.in/cg/Rajkot/City-Guide/About-5.jpg',
    'hhttps://im.hunt.in/cg/Rajkot/City-Guide/about.jpg',
    'https://im.hunt.in/cg/Rajkot/City-Guide/About-7.jpg',
    'https://cdn.britannica.com/55/142555-050-E240139E/Jubilee-Gardens-Rajkot-Gujarat-India.jpg',
    'https://upload.wikimedia.org/wikipedia/en/thumb/0/06/School_of_Engineering_RKU.jpeg/520px-School_of_Engineering_RKU.jpeg',
  ];

  final List detailslist = [
    'The rich chronology of Rajkot is known for its different dynasties that ruled over this place for long time. It has made significant contribution to the freedom movement of country. The most important historical revelation related to the city is its association with Mahatma Gandhi who spent most of his life in this city itself.Over the period of time, it witnessed huge transformations in its culture and economy. During pre independence era and earlier parts of post independence, it was the capital of Saurashtra region which was then a separate state. In 1956, Saurashitra was merged with Bombay State and in 1960, Rajkot also became its part.',
    'Rajkot is a prominent historical destination in Gujarat with rich traditional history to reveal. For the tourists, this city offers lots of attractions in the form of museums, gardens, ashrams, temples, dams, and lakes. These places in the city are reminiscent of its historical background and cultural transitions over the ages. They depict its prominence in the freedom movement and development of this entire region. For the tourists, these attractions are like a journey to the vividness of this place over the layers of its chronology.Rajkot is a prominent historical destination in Gujarat with rich traditional history to reveal. For the tourists, this city offers lots of attractions in the form of museums, gardens, ashrams, temples, dams, and lakes. These places in the city are reminiscent of its historical background and cultural transitions over the ages. They depict its prominence in the freedom movement and development of this entire region. For the tourists, these attractions are like a journey to the vividness of this place over the layers of its chronology.',
    'With support of GIDC and GSFC, local economy of Rajkot is flourishing with its huge industries. It also recently received aid of Rs. 28 crores from World Bank for developing infrastructure of this city. There are many large scale projects of real estate and infrastructure going on here with government and private partnership.Industries are the backbone of its economy. It has many leading small scale industries in manufacturing sector which include forging, casting, foundry units, auto parts, watch parts, diesel engines, kitchen appliances, bearings, machine tools, etc. Software development and share market is also the factors leading to economic development of this region. Rajkot is a leading market for gold and its jewelry.',
    'The culture rich city of Rajkot is known for its performing arts and handicrafts. Basically, the people living in rural areas are engaged in various hand works that include textile printing, furnishing items, leather work, handlooms, crochet, knitting, etc. Gold jewelry is also a part of its hand arts with rich patterns and designs of jewelry being manufactured here. Patola weaving and weft dyeing are the most popular handicrafts of Rajkot.The culture rich city of Rajkot is known for its performing arts and handicrafts. Basically, the people living in rural areas are engaged in various hand works that include textile printing, furnishing items, leather work, handlooms, crochet, knitting, etc. Gold jewelry is also a part of its hand arts with rich patterns and designs of jewelry being manufactured here. Patola weaving and weft dyeing are the most popular handicrafts of Rajkot.',
    'Rajkot has a unique blend enriched with multi ethnic cultures. the people here are very fond of their age old traditions and follow them with zeal. Hindus are the dominant population here and they are mostly pure vegetarians. Women in Rajkot love to dress up in traditional attire like saree with typical Gujarati style and loads of gold jewelry. They have deep penchant for gold jewelry that they flaunt at the cultural events and festivals. Men in Rajkot wear flowy kurtas and pyjamas while for casual wearing, they prefer western wear only. The colorful fervor of Rajkot has earned it the distinction of Rangilu Rajkot which means the city full of vibrant colors.The city has its unique genre in music called as Dayro which renditions folklores and it also has Kathiyawadi form of music performed by the music groups of city. All forms of Gujarati dance are performed here by the men and women of Rajkot. As it is located in Kathiyawad peninsula, people here are also referred to as Kathiyawadis. The main languages spoken here include Gujarati, Hindi, Urdu, English, and Marathi. It offers rich known for their rich mix of spices and ghee. All the Gujarati dishes are included in the traditional platter of this city. ',
    'The city was the capital of the former princely state of Rajkot and of the former Western India States Agency. It is now an important commercial and industrial centre. The manufacture of cotton and woolen textiles is a major activity; ceramics, diesel engines, and water pump sets are also produced in the city. Rajkot is known for its traditional handicrafts (silver work, embroidery, and patola weaving). Educational institutions include Rajkumar College (1870) and several colleges affiliated with Saurashtra University. The Watson Museum and Library, housing silver, textiles, and other artifacts, is in the Jubilee Gardens of Rajkot. The city is an important junction on the Western Railway, with connections to most major cities in the state. It is also served by major highways and an airport.The city was the capital of the former princely state of Rajkot and of the former Western India States Agency. It is now an important commercial and industrial centre. The manufacture of cotton and woolen textiles is a major activity; ceramics, diesel engines, and water pump sets are also produced in the city. Rajkot is known for its traditional handicrafts (silver work, embroidery, and patola weaving). Educational institutions include Rajkumar College (1870) and several colleges affiliated with Saurashtra University. The Watson Museum and Library, housing silver, textiles, and other artifacts, is in the Jubilee Gardens of Rajkot. The city is an important junction on the Western Railway, with connections to most major cities in the state. It is also served by major highways and an airport.',
    'RK University was established in 2009. RKU is located in Rajkot, Gujarat. It is affiliated to Gujarat Technological University (GTU). RKU is approved by AICTE.  RKU is recognized by the University Grants Commission. RKU aims to be a leading institution in imparting education to help students become responsible world citizens who are sensitive to the needs of others in their society. RKU is a member of the Association of Indian Universities (AIU).RKU offers programs ranging from diploma, undergraduate, postgraduate, and doctoral programs in the domains of Management, Computer Applications, Engineering, Pharmacy, Physiotherapy and Science. Admissions at RKU to these courses are conducted every year. RKU offers programs ranging from diploma, undergraduate, postgraduate, and doctoral programs in the domains of Management, Computer Applications, Engineering, Pharmacy, Physiotherapy and Science. Admissions at RKU to these courses are conducted every year. ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListTileDetailsPage(
                  title: list[index],
                  imageurl: imagelist[index],
                  DetailsText: detailslist[index],
                ),));
              },
              child: Card(
                elevation: 1,
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(list[index]),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

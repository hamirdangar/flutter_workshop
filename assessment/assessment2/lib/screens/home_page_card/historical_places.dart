//@dart=2.9
import 'package:flutter/material.dart';

import '../../componets/list_tile_details_page.dart';

class HistoricalPlaces extends StatelessWidget {
  final String title;
  final void Function() onTap;
  HistoricalPlaces({Key key, this.title, this.onTap}) : super(key: key);

  final List list = [
    'Mahatma Gandhi Museum',
    'BAPS Shri Swaminarayan',
    'Shri Ramakrishna Ashrama',
    'ISKCON Temple RAJKOT',
    'Prem Mandir',
    'Race Course Garden',
    'Mohandas Gandhi High School',
  ];

  final List imagelist = [
    'https://www.gujarattourism.com/content/dam/gujrattourism/images/gandhi-circuit/mahatma-gandhi-museum-(alfred-high-school)/Mahatma-Gandhi-Museum-Rajkot-Thumbnail.jpg',
    'https://www.baps.org//Data/Sites/1/Media/LocationImages/144144-rajkot.jpg',
    'https://c1.staticflickr.com/5/4157/33638034954_502e3cf359_b.jpg%20width=1024%20height=576%20alt=Rajkot2',
    'https://iskconrajkot.com/wp-content/uploads/2019/07/IMG_20190702_195132-1024x475.jpg',
    'https://www.trawell.in/admin/images/upload/670518641Rajkot_Prem_Mandir.jpg',
    'https://lh3.googleusercontent.com/p/AF1QipPTrVDRNJV6qhKHrl7n1MMHpI_yoUVEdvx_JRt0=s1360-w1360-h1020',
    'https://www.gujarattourism.com/content/dam/gujrattourism/images/july/Mahatma-Gandhi-Museum-Banner.jpg',
  ];

  final List detailslist = [
    'Mahatma Gandhi Museum, Rajkot was previously known as Mohandas Gandhi Vidhyalaya, Alfred High School and Kathiawar High School established on 17th October 1853 with 36 students.Gandhiji completed his graduation from Alfred High School (Kathiawar High School) in the year 1887. Out of 38 students who had passed the high school entrance examination, Gandhiji was one of only two students in his year of matriculate. Mahatma Gandhi Museum is operated by joint management of Rajkot Municipal Corporation (RMC) and Gujarat Tourism. As a part of the celebration of the 150th birth anniversary of Gandhiji, Mahatma Gandhi Museum, Rajkot inaugurated by Hon. Prime Minister of India Shree Narendra Modi along with Chief Minister of Gujarat Shree Vijay Rupani and Deputy Chief Minister Shree Nitin Patel on 30th September 2018.',
    'Bochasanwasi Shri Akshar Purushottam Swaminarayan Sanstha (BAPS) is a socio-spiritual Hindu faith with its roots in the Vedas. It was revealed by Bhagwan Swaminarayan (1781-1830) in the late 18th century and established in 1907 by Shastriji Maharaj (1865-1951). Founded on the pillars of practical spirituality, the BAPS reaches out far and wide to address the spiritual, moral and social challenges and issues we face in our world. Its strength lies in the purity of its nature and purpose. BAPS strives to care for the world by caring for societies, families and individuals. Its universal work through a worldwide network of over 3,850 centers has received many national and international awards and affiliation with the United Nations. Today, a million or more Swaminarayan followers begin their day with puja and meditation, lead upright, honest lives and donate regular hours in serving others. No Alcohol, No Addictions, No Adultery, No Meat, No Impurity of body and mind are their five lifetime vows. Such pure morality and spirituality forms the foundation of the humanitarian services performed by BAPS.',
    'સહર્ષ જણાવવાનું કે સ્વામી વિવેકાનંદની જન્મ જયંતિની ઉજવણીના ભાગરુપે ૧૧મી રાજ્ય સ્તરીય સ્વામી વિવેકાનંદ વિષયક લેખિત ક્વીઝ સ્પર્ધા યોજાઈ રહી છે. આપની શાળાના ૯ થી ૧ર ધોરણના વિધાર્થીઓને પ્રોત્સાહિત કરી આ સ્પધમાં આપની શાળાને ભાગ લેવા આમંત્રણ છે. વિધાર્થીઓમાં ચારિત્ર્ય ઘડતર દ્વારા રાષ્ર નિર્માણના આ કાર્યમાં સહભાગી થશો તેવી અપેક્ષા છે.સહર્ષ જણાવવાનું કે સ્વામી વિવેકાનંદની જન્મ જયંતિની ઉજવણીના ભાગરુપે ૧૧મી રાજ્ય સ્તરીય સ્વામી વિવેકાનંદ વિષયક લેખિત ક્વીઝ સ્પર્ધા યોજાઈ રહી છે. આપની શાળાના ૯ થી ૧ર ધોરણના વિધાર્થીઓને પ્રોત્સાહિત કરી આ સ્પધમાં આપની શાળાને ભાગ લેવા આમંત્રણ છે. વિધાર્થીઓમાં ચારિત્ર્ય ઘડતર દ્વારા રાષ્ર નિર્માણના આ કાર્યમાં સહભાગી થશો તેવી અપેક્ષા છે.સહર્ષ જણાવવાનું કે સ્વામી વિવેકાનંદની જન્મ જયંતિની ઉજવણીના ભાગરુપે ૧૧મી રાજ્ય સ્તરીય સ્વામી વિવેકાનંદ વિષયક લેખિત ક્વીઝ સ્પર્ધા યોજાઈ રહી છે. આપની શાળાના ૯ થી ૧ર ધોરણના વિધાર્થીઓને પ્રોત્સાહિત કરી આ સ્પધમાં આપની શાળાને ભાગ લેવા આમંત્રણ છે. વિધાર્થીઓમાં ચારિત્ર્ય ઘડતર દ્વારા રાષ્ર નિર્માણના આ કાર્યમાં સહભાગી થશો તેવી અપેક્ષા છે.',
    'ISKCON Rajkot Sri Sri Radha Neelmadhav Dham is a Hare Krishna temple, community, and ashram dedicated to the practice of bhakti-yoga or loving service to Krishna, the Supreme Personality of Godhead. We are a branch of the International Society for Krishna Consciousness (ISKCON), a worldwide spiritual movement founded by His Divine Grace A.C. Bhaktivedanta Swami Prabhupada, in New York City in 1966. Under the guidance of His Holiness Mahavishnu Goswami Maharaj in 2003, this center was inaugurated by the hands of The Chief Minister of Gujarat Sri Narendra Modi and Alfred Ford (Ambarish Das) an owner of the Ford Auto motors-US.ISKCON Rajkot Sri Sri Radha Neelmadhav Dham is a Hare Krishna temple, community, and ashram dedicated to the practice of bhakti-yoga or loving service to Krishna, the Supreme Personality of Godhead. We are a branch of the International Society for Krishna Consciousness (ISKCON), a worldwide spiritual movement founded by His Divine Grace A.C. Bhaktivedanta Swami Prabhupada, in New York City in 1966. Under the guidance of His Holiness Mahavishnu Goswami Maharaj in 2003, this center was inaugurated by the hands of The Chief Minister of Gujarat Sri Narendra Modi and Alfred Ford (Ambarish Das) an owner of the Ford Auto motors-US.',
    'Literally translates to the Temple of Love, Prem Mandir is dedicated to Sacred Heart of Jesus. The striking feature of the cathedral is its architecture which predominantly resembles traditional Indian temples of various religions rather than a church. The cathedral was designed by Ashwinbhai Sanghvi and the glass work was done by Balan.Literally translates to the Temple of Love, Prem Mandir is dedicated to Sacred Heart of Jesus. The striking feature of the cathedral is its architecture which predominantly resembles traditional Indian temples of various religions rather than a church. The cathedral was designed by Ashwinbhai Sanghvi and the glass work was done by Balan.',
    'This is known to be an annual event where the ground is filled with all sorts of ride, food and goods stalls. People from all around Rajkot district come to enjoy these 4 days of festival. Basically, Rajkot shuts down for a week. People plan to take 4-5 days holidays and drive or bus out of city, while giving space for all near by towns and village folks to come to enjoy the. It services nearly 1 million people in 4 days of festival. Place is filled with noise and laughter and screams from rides that otherwise is not easily accisible. If you plan to be in saurashtra, make sure to visit Rajkot for this Mela. It is going to be a memory for long time.This is known to be an annual event where the ground is filled with all sorts of ride, food and goods stalls. People from all around Rajkot district come to enjoy these 4 days of festival. Basically, Rajkot shuts down for a week. People plan to take 4-5 days holidays and drive or bus out of city, while giving space for all near by towns and village folks to come to enjoy the. It services nearly 1 million people in 4 days of festival. Place is filled with noise and laughter and screams from rides that otherwise is not easily accisible. If you plan to be in saurashtra, make sure to visit Rajkot for this Mela. It is going to be a memory for long time.',
    'This school was constructed during British rule in India by political agent Kernel Singh, and was the first English school in the saurashtra (region). Originally called Rajkot English School, it was founded on 17 October 1853, and later became a full-fledged high school. By 1868 it came to be known as Rajkot High School, and was named Alfred High School in 1907. The present buildings of the Alfred High School were built for Kathiawar by the Nawab of Junagadh, Nawab Nawab Sir Muhammad Bahadur Khanji Babi, and was named Prince Alfred, the Duke of Edinburgh, as a memorial. This school was opened in January, 1875 by Sir Philip Wodehouse, Governor of Bombay.This school was constructed during British rule in India by political agent Kernel Singh, and was the first English school in the saurashtra (region). Originally called Rajkot English School, it was founded on 17 October 1853, and later became a full-fledged high school. By 1868 it came to be known as Rajkot High School, and was named Alfred High School in 1907. The present buildings of the Alfred High School were built for Kathiawar by the Nawab of Junagadh, Nawab Nawab Sir Muhammad Bahadur Khanji Babi, and was named Prince Alfred, the Duke of Edinburgh, as a memorial. This school was opened in January, 1875 by Sir Philip Wodehouse, Governor of Bombay.',
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

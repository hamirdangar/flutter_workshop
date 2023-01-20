
//@dart=2.9
import 'package:flutter/material.dart';

import '../../componets/list_tile_details_page.dart';

class PlacesToSeeAround extends StatelessWidget {
  final String title;
  final void Function() onTap;
  PlacesToSeeAround({Key key, this.title, this.onTap}) : super(key: key);

  final List list = [
    'Analgadh Hill Station',
    'Gondal City',
    'Hingolgadh Palace And Bird Sanctuary',
    'Khodaldham Temple',
    'Morbi Palace',
    'Virpur Jalaram Temple',
    'Vankaner Palace',
  ];

  final List imagelist = [
    'https://images.theindia.co.in/place/thumbnail_cmFqa290LWFuYWxnYWRoLTExMDU4MjQwNjM3.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Gondal%2C_India.jpg/375px-Gondal%2C_India.jpg',
    'https://lh3.googleusercontent.com/p/AF1QipPKifhNnVAMlJ0hy68KZSQWmmq0G6qrjjKapmss=s1360-w1360-h1020',
    'https://www.khodaldhamtrust.org/upload_data/cms/images/cms_200130_115445_5e3276adbf3a9.jpg',
    'https://ak-d.tripcdn.com/images/220d0s000000hjnlrB008_R_640_440_R5_D.jpg_.webp',
    'https://www.gujarattourism.com/content/dam/gujrattourism/images/june/jalaram-mandir-virpur-banner.jpg',
    'https://filmcell.gujarattourism.com/upload/gallery/1536569344_334447.jpg',
  ];

  final List detailslist = [
      'Analgadh is a small village located at 17km from Gondal city in Rajkot district of Gujarat state India. This place is famous for Ancient fort and Kalaka Mataji temple located on hilltop surrounded by scenic beauty of farms. This temple is very ancient and the place is very isolated and less crowded. If you are looking for one day picnic spot near Rajkot or Gondal, this can be your best destination. The best time to visit Analgadh is monsoon season as greenery is spreading all around the fort which gives breathtaking views to visitors. You can enjoy the sunset from top of the hill which attracts people to visit Analgadh again & again. It is also having small garden with slides and cradle for children and can your best weekend destination to spend beautiful time with family and friends.',
      'Gondal is mentioned in texts like Ain-i-Akbari (written in the reign of Akbar) and Mirat-i-Ahmadi as a Vaghela state in Sorath (Saurashtra). The Gondal State in Kathiawar Agency was founded in 1634 by Thakore Shri Kumbhoji I Meramanji from the Jadeja dynasty, who received Ardoi and other villages from his father Meramanji.[3] Kumbhokis fourth descendant, Kumbhoji IV, increased the size of the state by acquiring parganas such as Dhoraji, Upleta, and Sarai.',
      'Hingolgadh Nature Education Sanctuary is located at Jasdan taluka in the district of Rajkot. The sanctuary covers a small area of around 654.07ha but still it is enriched with varied type of vegetation.Hingolgadh Nature Education Sanctuary is located at Jasdan taluka in the district of Rajkot. The sanctuary covers a small area of around 654.07ha but still it is enriched with varied type of vegetation.Hingolgadh Nature Education Sanctuary is located at Jasdan taluka in the district of Rajkot. The sanctuary covers a small area of around 654.07ha but still it is enriched with varied type of vegetation.',
      'The temple was constructed by Shree Khodaldham Trust, an organisation of Leuva Patel community from Rajkot. The temple construction started in 2012 with laying of the foundation stone. It was inaugurated on 21 January 2017.[1] The inauguration ceremony was attended by more than 3,00,0000 people.[2] The temple complex was constructed in three phases over a area of 158 bigha and at cost of ₹250 crore (US\$31 million).',
      'The Darbargadh Palace by Heritage Villas is an ideal spot for travelers wanting to discover the city. The Darbargadh Palace by Heritage Villas offers a pleasant stay in Morbi for those traveling for business or leisure.Guests will find Mani Mandir, Morbi, Gujarat, Green Tower and Nagar Darwaza just a short distance from the hotelWhen guests have some time on their hands they can make use of the onsite facilities',
      'Jalaram Bapa popularly known as Bapa was a Hindu saint from Gujarat, India. He was born on 14 November 1799, one week after the Hindu festival of Diwali, which is associated with his Lord Rama.Jalaram Bapa was born in Virpur, Rajkot district, Gujarat, India in 1799, on the seventh day of the Kartika month. His father was Pradhan Thakkar and his mother was Rajbai Thakkar who belonged to Lohana clan. He was a devotee of the Hindu god Rama. Virpur is the workplace of Shree Jalaram Bapa.The main shrine of Jalaram Bapa is located at Virpur. The shrine is actually the house complex where Jalaram lived during his lifetime. The shrine houses the belongings of Jalaram and the deities of Rama, Sita, Lakshamana and Hanuman worshipped by him. It also has on display the Jholi and Danda said to be given by God',
      'The sprawling Ranjit Villas Palace is perched atop the Gadhio hills offers a splendid view. It was built by Maharana Raj Shri Amar Singhji who was the last ruler of the Wankaner Royal family. The place is built in Indo-sarsenic or Indo-Gothic style of architecture in 1907. Its interiors with Italian marble, English stain glass, Burma teak antique furniture, marble fountains, Murano chandeliers and hand woven carpets take you back to the splendors of royal living in the by-gone era. The Palace is open to guests staying at the Royal Oasis Hotel in Wankaner with Complimentary guided tour.',
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
          }
        ),
      ),
    );
  }
}

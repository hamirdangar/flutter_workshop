//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/home_page/pages/Community/residents.dart';
import '../../../constats_.dart';
import '../side_menu_pages/contact_page.dart';
import 'HelpPage.dart';
import 'events_page.dart';
import 'maintenance.dart';

class CommunitiPage extends StatefulWidget {
  CommunitiPage({Key key}) : super(key: key);

  @override
  State<CommunitiPage> createState() => _CommunitiPageState();
}

class _CommunitiPageState extends State<CommunitiPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('Engage', style: TextStyle(fontWeight: FontWeight.w700)),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      MyCard(
                        icon: Icons.people,
                        height: '100',
                        width: '100',
                        title: 'Residents',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => ResidentsPage(),));
                        },
                      ),
                      MyCard(
                        icon: Icons.help,
                        height: '100',
                        width: '100',
                        title: 'Help',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage(),));
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      MyCard(
                        icon: Icons.manage_accounts,
                        height: '100',
                        width: '100',
                        title: 'Maintenance',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => MaintenancePage(),));
                        },
                      ),
                      MyCard(
                        icon: Icons.event_note,
                        height: '100',
                        width: '100',
                        title: 'Events',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage(),));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('Discover', style: TextStyle(fontWeight: FontWeight.w700)),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      MyCard(
                        icon: Icons.emergency,
                        height: '100',
                        width: '100',
                        title: 'Emergency',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage(),));
                        },
                      ),
                      MyCard(
                        icon: Icons.report_problem,
                        height: '100',
                        width: '100',
                        title: 'Problems',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => null,));
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      MyCard(
                        icon: Icons.call,
                        height: '100',
                        width: '100',
                        title: 'Contact',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                         //Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
                        },
                      ),
                      MyCard(
                        icon: Icons.note,
                        height: '100',
                        width: '100',
                        title: 'notice',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => null,));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('Pay', style: TextStyle(fontWeight: FontWeight.w700)),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  MyCard(
                    icon: Icons.payment,
                    height: '100',
                    width: '100',
                    title: 'payment',
                    subtitle: 'Residents View Socity Residents & manage..',
                    onTab: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => null,));
                    },
                  ),
                  MyCard(
                    icon: Icons.payments_outlined,
                    height: '100',
                    width: '100',
                    title: 'Rent',
                    subtitle: 'Residents View Socity Residents & manage..',
                    onTab: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => null,));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

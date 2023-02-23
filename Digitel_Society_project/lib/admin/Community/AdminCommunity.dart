//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/home_page/pages/Community/residents.dart';
import '../../../constats_.dart';
import 'admin_events.dart';
import 'admin_maintenance.dart';

class AdminCommuniti extends StatefulWidget {
  AdminCommuniti({Key key}) : super(key: key);

  @override
  State<AdminCommuniti> createState() => _AdminCommunitiState();
}

class _AdminCommunitiState extends State<AdminCommuniti> {
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
                        icon: Icons.manage_accounts,
                        height: '100',
                        width: '100',
                        title: 'Maintenance',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMaintenancePage(),));
                        },
                      ),
                      MyCard(
                        icon: Icons.event_note,
                        height: '100',
                        width: '100',
                        title: 'Events',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => AdminEvents(),));
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
                        icon: Icons.payments_outlined,
                        height: '100',
                        width: '100',
                        title: 'Rent',
                        subtitle: 'Residents View Socity Residents & manage..',
                        onTab: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => null,));
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
          ],
        ),
      ),
    );
  }
}

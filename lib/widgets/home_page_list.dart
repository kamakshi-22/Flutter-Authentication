import 'package:aicte_app/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePageList extends StatefulWidget {
  const WelcomePageList({Key? key}) : super(key: key);

  @override
  State<WelcomePageList> createState() => _WelcomePageListState();
}

class _WelcomePageListState extends State<WelcomePageList> {
  List pages = [
    [
      //1
      'Dashboard',
      'A stastical information of the institutes in India',
      Uri.parse(
          'https://facilities.aicte-india.org/dashboard/pages/dashboardaicte.php')
    ],
    [
      //7
      'Institutes with Accrediated Courses',
      'List of Institutes with NBA Accrediated Courses',
      Uri.parse(
          'https://facilities.aicte-india.org/dashboard/pages/aicte_nba.php')
    ],
    [
      //2
      'Faculty in AICTE Approved Universities',
      'Faculty present in AICTE approved univerities/institutions',
      Uri.parse(
          'https://facilities.aicte-india.org/dashboard/pages/faculties.php')
    ],
    [
      //3
      'Student Development Schemes',
      'Explore various schemes and scholarships run by AICTE to promote technical education',
      Uri.parse(
          'https://www.aicte-india.org/schemes/students-development-schemes')
    ],
    [
      //4
      'Communnity Colleges',
      'AICTE approved polytechnics and equivalent technical institutions',
      Uri.parse(
          'https://www.aicte-india.org/education/community-colleges')
    ],
    [
      //5
      'Graphs & Charts',
      'Graphical representation of the intakes and enrollment',
      Uri.parse(
          'https://facilities.aicte-india.org/dashboard/pages/angulardashboard.php#!/graphs')
    ],
    [
      //6
      'PMKVY-TI Dashboard',
      'A comprehensive view on skilling the youth under PMKVY-TI',
      Uri.parse(
          'https://facilities.aicte-india.org/dashboard_pmkvy/pages/dashboardaicte.php')
    ],
    [
      //8
      'Unapproved Institutes',
      'Institutions conducting technical programmes without approval',
      Uri.parse(
          'https://facilities.aicte-india.org/dashboard/pages/angulardashboard.php#!/unapproved')
    ],
    [
      //9
      'Closed Courses',
      'AICTE approved institutions with progressive Closed Courses',
      Uri.parse(
          'https://facilities.aicte-india.org/dashboard/pages/angulardashboard.php#!/closedcourse')
    ],
    [
      //10
      'Closed Institutes',
      'AICTE approved Progressive Closed Institutes',
      Uri.parse(
          'https://facilities.aicte-india.org/dashboard/pages/angulardashboard.php#!/closedinstitute')
    ],
    [
      //11
      'Institutes with Autonomy',
      'List of Institutes with Academic Autonomy',
      Uri.parse(
          'https://facilities.aicte-india.org/dashboard/pages/aicte_autonomus.php')
    ],
  ];

  @override
  //final Uri _url = pages[index][2];

  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: pages.length,
      itemBuilder: (context, index) => Card(
        shadowColor: Colors.transparent,
        child: Column(
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              title: Text(
                pages[index][0],
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                pages[index][1],
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.orange,
              ),
              onTap: () => _launchUrl(index),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(index) async {
    target: LinkTarget.blank;
    if (!await launchUrl(pages[index][2])) {
      throw "Could not open ";
      
    }
    
  }
}

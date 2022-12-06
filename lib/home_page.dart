import 'package:aicte_app/widgets/app_bar.dart';
import 'package:aicte_app/widgets/app_drawer.dart';
import 'package:aicte_app/widgets/carousel_page.dart';
import 'package:aicte_app/widgets/home_page_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Welcome to AICTE'),
        ),
        drawer: const AppDrawer(),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/AICTE-logo.png'),
                Image.asset('assets/images/AICTE-text.png'),
              ],

              
            ),

            const CarouselPage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 08, 24, 08),
                color: Color.fromARGB(163, 95, 95, 95),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "AICTE was set up in November 1945 as a national-level Apex Advisory Body to conduct a survey on the facilities available for technical education and to promote development in the country in a coordinated and integrated manner.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Link(
                        target: LinkTarget.self,
                        uri: Uri.parse('https://www.aicte-india.org/about-us/overview'),
                        builder: ((context, followLink) => ElevatedButton(
                            onPressed: followLink,
                            child: const Text(
                              'Find out more',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            )))
                          ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 2,
                    color: Colors.teal,
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: WelcomePageList(),
            )
          ],
        ));
  }
}


// SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(24, 08, 24, 08),
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //const SizedBox(height: 80,),
//               Image.asset('assets/images/AICTE-logo.png'),
//               Image.asset('assets/images/AICTE-text.png'),
//               Container(
//                 padding: const EdgeInsets.fromLTRB(24, 08, 24, 08),
//                 color: Colors.teal,
//                 height: 150,
//                 child: Column(
//                   children: <Widget>[
//                     const Text(
//                       "AICTE was set up in November 1945 as a national-level Apex Advisory Body to conduct a survey on the facilities available for technical education and to promote development in the country in a coordinated and integrated manner.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.w400,
//                         letterSpacing: 1.0,
//                       ),
//                     ),

//                   ],
                  
//                 ),
//               ),
              
//             ],
//           ),
//         ),
//       ),

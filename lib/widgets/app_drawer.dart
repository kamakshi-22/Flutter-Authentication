import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: ListView(
            children: <Widget>[
              const Text(
                'Signed In as',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                user.email!,
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 12,
                  color: Colors.white,
                ),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => FirebaseAuth.instance.signOut(),
              ),
            ],
          )),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Quick Links',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
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
                  height: 16,
                ),
                Link(
                    target: LinkTarget.self,
                    uri: Uri.parse('https://ekumbh.aicte-india.org/'),
                    builder: ((context, followLink) => GestureDetector(
                          onTap: followLink,
                          child: const Text(
                            'eKUMBH Portal',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              //decoration: TextDecoration.underline
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Link(
                    target: LinkTarget.self,
                    uri: Uri.parse('https://internship.aicte-india.org/'),
                    builder: ((context, followLink) => GestureDetector(
                          onTap: followLink,
                          child: const Text(
                            'AICTE Internship Portal',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              //decoration: TextDecoration.underline
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Link(
                    target: LinkTarget.self,
                    uri: Uri.parse('https://1crore.aicte-india.org/'),
                    builder: ((context, followLink) => GestureDetector(
                          onTap: followLink,
                          child: const Text(
                            'DigitalSkilling 1 Crore Students',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              //decoration: TextDecoration.underline
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Link(
                    target: LinkTarget.self,
                    uri: Uri.parse('https://www.aicte-india.org/CyberSecurity'),
                    builder: ((context, followLink) => GestureDetector(
                          onTap: followLink,
                          child: const Text(
                            'Cyber Security Awareness',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              //decoration: TextDecoration.underline
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Link(
                    target: LinkTarget.self,
                    uri: Uri.parse('https://translation.aicte-india.org/'),
                    builder: ((context, followLink) => GestureDetector(
                          onTap: followLink,
                          child: const Text(
                            'AICTE-AI Language Translation Tool',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              //decoration: TextDecoration.underline
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Link(
                    target: LinkTarget.self,
                    uri: Uri.parse('https://www.aicte-india.org/atal'),
                    builder: ((context, followLink) => GestureDetector(
                          onTap: followLink,
                          child: const Text(
                            'ATAL Academy',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              //decoration: TextDecoration.underline
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Link(
                    target: LinkTarget.self,
                    uri: Uri.parse('https://aicte-india.org/odl/'),
                    builder: ((context, followLink) => GestureDetector(
                          onTap: followLink,
                          child: const Text(
                            'ODL and Online Regulatory Framework',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              //decoration: TextDecoration.underline
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Link(
                    target: LinkTarget.self,
                    uri:
                        Uri.parse('https://www.aicte-india.org/policy-reforms'),
                    builder: ((context, followLink) => GestureDetector(
                          onTap: followLink,
                          child: const Text(
                            'Policies & Reforms',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              //decoration: TextDecoration.underline
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.1,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// IconButton(
//             icon: const Icon(Icons.lightbulb),
//             onPressed: () {
//               Get.isDarkMode
//                  /? Get.changeTheme(ThemeData.light())
//                   : Get.changeTheme(ThemeData.dark());
//             }),

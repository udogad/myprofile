// ignore_for_file: deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutMe(),
    );
  }
}

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add functionality for settings button
            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Add functionality for info button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 120.0,
              backgroundImage:
                  AssetImage('assets/images/ims.jpg'), // my profile image here
            ),
            SizedBox(height: 16.0),
            Text(
              'Udochukwu Ukasoanya',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60.0),
            Text(
              textAlign: TextAlign.start,
              'Bios:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    'A passionate Flutter developer with experience in building beautiful and functional '
                    'mobile applications.\n I love creating intuitive and user-friendly designs and solving '
                    'complex problems with innovative solutions.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaIcon(
                  iconPath: 'assets/icons/whatsapp.png', //  icon assets
                  url: 'https://wa.me/1234567890',
                ),
                SizedBox(width: 16.0),
                SocialMediaIcon(
                  iconPath: 'assets/icons/facebook.png',
                  url: 'https://facebook.com/yourprofile',
                ),
                SizedBox(width: 16.0),
                SocialMediaIcon(
                  iconPath: 'assets/icons/linkedin.png',
                  url: 'https://linkedin.com/in/yourprofile',
                ),
                SizedBox(width: 16.0),
                SocialMediaIcon(
                  iconPath: 'assets/icons/github.png',
                  url: 'https://github.com/',
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Powered by Udogad',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final String iconPath;
  final String url;

  SocialMediaIcon({required this.iconPath, required this.url});

  Future<void> _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: CircleAvatar(
        radius: 24.0,
        backgroundImage: AssetImage(iconPath),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

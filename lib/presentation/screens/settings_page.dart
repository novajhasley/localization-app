import 'dart:ui';

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final List<String> _content = [
    "Hello! I'm Nova Hasley, a seasoned Full Stack Developer and Certified Scrum Master with over 9 years of experience in building innovative and scalable solutions for mobile, desktop, and web platforms. I thrive in dynamic environments where I can apply my technical expertise and collaborate with cross-functional teams to deliver impactful solutions.",
    "💻 Technical Proficiency:",
    "Languages: Dart, Flutter, React, HTML, CSS, JavaScript, Node, Python",
    "Databases: SQL, NoSQL",
    "Tools & Technologies: Git, Bash, Firebase, AWS, MongoDB, RESTful APIs, Postman",
    "Data Analysis: Jupyter, Power Bi, Tableau",
    "Project Management: Agile/Scrum methodologies, Jira, Confluence, Kanban, GitHub",
    "I am pursuing new opportunities and can be reached through this profile, or by phone at: 830-459-8287."
  ];

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //BACKGROUND IMAGE
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Center(
            child: OverflowBox(
              maxWidth: double.infinity,
              child: Transform.translate(
                offset: const Offset(200, 100),
                child: Image.asset('assets/images/backgrounds/zigzag.png',
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        //CONTENT
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/your_picture.png'), // TODO: Replace with your picture
                ),
                title: Text(
                  'Nova Hasley',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.7)),
                ), // TODO: Replace with your name
              ),
              const Divider(),
              ..._content.map((text) => Text(
                    text,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

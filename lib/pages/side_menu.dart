import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.2),
                foregroundColor: Colors.white,
                child: const Icon(Icons.person_outline),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ashu",
                    style: TextStyle(
                        color: Colors.white, fontSize: 17, fontFamily: "Inter"),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Software Engineer",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 15,
                        fontFamily: "Inter"),
                  )
                ],
              ),
            ],
          ),
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [Text('hi')],
            ),
          ),
        ),
      ]),
    );
  }
}

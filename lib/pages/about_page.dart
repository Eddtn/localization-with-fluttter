import 'package:flutter/material.dart';
import 'package:localization_in_flutter/routes/route_names.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Container(
        child: MaterialButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, settingsRoute);
          },
          color: Colors.blue,
          child: Text('navigating to about page'),
        ),
      ),
    );
  }
}

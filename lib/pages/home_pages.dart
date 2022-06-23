import 'package:flutter/material.dart';
import 'package:localization_in_flutter/pages/about_page.dart';
import 'package:localization_in_flutter/routes/route_names.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: __drawerList(),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
        key: _key,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: const Center(
                child: Text(
                  'Personal Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return 'required field';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Name '),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return 'required field';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter Email Address',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select date of birth',
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year),
                    lastDate: DateTime(DateTime.now().year * 20));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  _showSuccessDialog();
                }
              },
              height: 50,
              shape: StadiumBorder(),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  'Submit Information',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ));
  }

  Container __drawerList() {
    TextStyle _textStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 24,
    );
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: const CircleAvatar(),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
              size: 36,
            ),
            title: const Text(
              'About us',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
              size: 36,
            ),
            title: const Text(
              'settings',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}

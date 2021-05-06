import 'package:flutter/material.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var length = 0;
  bool _isWithLetters = true;
  bool _isWithUppercase = true;
  bool _isWithNumbers = true;
  bool _isWithSpecial = true;
  double _numberCharPassword = 8;
  String newPassword = '';

  final password = RandomPasswordGenerator();
  TextEditingController _passlength = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Random Password Generator',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                      controller: _passlength,
                      decoration: InputDecoration(
                          hintText: "Enter the length  (Default is 8)"),
                      keyboardType: TextInputType.number),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_passlength.text.trim().isNotEmpty) {
                        _numberCharPassword =
                            double.parse(_passlength.text.trim());
                      }
                      if (_numberCharPassword <= 100) {
                        newPassword = password.randomPassword(
                            letters: _isWithLetters,
                            numbers: _isWithNumbers,
                            passwordLength: _numberCharPassword,
                            specialChar: _isWithSpecial,
                            uppercase: _isWithUppercase);
                      } else {
                        newPassword = "Please Enter Length less than 100 ";
                      }
                      print(newPassword);

                      setState(() {});
                    },
                    child: Text("Generate")),
                SizedBox(
                  height: 10,
                ),
                if (newPassword.isNotEmpty && newPassword != null)
                  Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          newPassword,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                if (newPassword.isNotEmpty && newPassword != null)
                  ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: newPassword));
                    },
                    child: Icon(Icons.copy_rounded),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

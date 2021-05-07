import 'package:flutter/material.dart';
import 'package:second_app/routes.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login",
            style: TextStyle(
                fontSize: 39, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              children: [
                Image.asset("assets/images/login.png"),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Name"),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Enter Password"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Myroutes.homeRoute);
                    },
                    child: Text("Login"))
              ],
            ),
          )
        ],
      ),
    );
  }
}

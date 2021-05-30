import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.00,
          ),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.00,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.00, horizontal: 32.00),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 20.00,
                ),
                ElevatedButton(
                  child: Text("Login"),
                  style: TextButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    print("Hi Dinesh");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

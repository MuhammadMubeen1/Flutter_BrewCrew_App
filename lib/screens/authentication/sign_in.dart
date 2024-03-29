import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
  late final Function toggleView;
  SignIn({required this.toggleView});
  @override
  _SignInState createState() => _SignInState();}
class _SignInState extends State<SignIn> {
  final AuthService auth = AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew '),
        actions: [
          FlatButton.icon(
              onPressed: () {widget.toggleView();},
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(onChanged: (val) {
                  setState(() => email = val);
                }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                ),
              ],
            ),
          )),
    );
  }
}

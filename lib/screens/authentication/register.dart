import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  late final Function toggleView;
  Register({required this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey=GlobalKey<FormState>();
  String email = '';
  String password = '';
   String error='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up in to Brew Crew '),
        actions: [FlatButton.icon(onPressed: () {widget.toggleView();},
              icon: Icon(Icons.person),
              label: Text('Sign In')),],),
      body: Container(
           key: _formKey ,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    validator:(val)=>val!.isEmpty? 'Enter an Email' :null,
                    onChanged:(val){
                  setState(() => email = val);
                }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  validator:(val)=>val!.length<6? 'Enter a Password 6+ chars long' :null,
                  onChanged: (val) {setState(() => password = val);}),
                SizedBox(height: 20.0,),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text('Register', style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState!.validate())
                      {
                        dynamic result =await _auth.registerwithpasseord(email, password);
                        if(result==null)
                          {
                           setState(()=>error='please supply a valid email');
                          }else
                            {

                            }
                      }
                  },
                ),

                SizedBox(height: 12.0,),
                Text( error,style:TextStyle(color: Colors.red,fontSize: 14.0))
              ],
            ),
          )),
    );
  }
}

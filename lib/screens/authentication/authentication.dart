import 'package:brewcrew/screens/authentication/register.dart';
import 'package:brewcrew/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';
class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);
  @override
  _AuthenticationState createState() => _AuthenticationState();}
 class _AuthenticationState extends State<Authentication> {
  bool showSignIn=true;
  void toggleView()
  {
    setState(()=>showSignIn=!showSignIn);


  }

  @override
  Widget build(BuildContext context)
  {
    if(showSignIn)
      {
        return SignIn(toggleView:toggleView);
      }else
        {
          return Register(toggleView:toggleView);
        }
  }
}

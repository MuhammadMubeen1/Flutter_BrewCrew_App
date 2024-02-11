import 'package:brewcrew/models/user.dart';
import 'package:brewcrew/screens/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    if(user==null)
      {
        return Authentication();
      }else
        {
          return Home();
        }}}

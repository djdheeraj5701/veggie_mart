
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veggie_mart/Pages/SignInPage.dart';
import 'package:veggie_mart/Services/AuthNotifier.dart';
import 'package:veggie_mart/Services/ProductAPI.dart';
import 'package:veggie_mart/Services/generalservices.dart';
import 'package:veggie_mart/Widgets/signinupwidgets.dart';
import 'package:veggie_mart/model/User.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  InputController inputController=new InputController();
  Users _user;

  forSignin(){
    Navigator.pushReplacement(context,
      MaterialPageRoute(
          builder: (context) => SignInScreen()),
    );
  }
  forSignup() {
    print("sending data for sign In");
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(
        context, listen: false);
    print("Go to signIn");
    _user.email = inputController.email.text;
    _user.password = inputController.password.text;
    signup(_user, authNotifier);
    Navigator.pushReplacement(context,
      MaterialPageRoute(
          builder: (context) => SignInScreen()),
    );
  }

  @override
  void initState(){
    onlyPortraitMode();
    super.initState();
  }

  @override
  dispose(){
    allOrientationModes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff07FEC9),
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height*0.1,
              left: MediaQuery.of(context).size.width*0.05,
              child: Container(
                height: MediaQuery.of(context).size.height*0.8,
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          'Create a new Account',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      NameInput(inputController.name),
                      EmailInput(inputController.email),
                      PasswordInput(inputController.password),
                      SubmitButton('Sign up', forSignup),
                      SigninAlternative('up'),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                            HyperLink('Sign in now!', forSignin)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


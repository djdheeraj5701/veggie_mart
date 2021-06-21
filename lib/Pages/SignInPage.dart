import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veggie_mart/Pages/List_Page.dart';
import 'package:veggie_mart/Pages/SignUpPage.dart';
import 'package:veggie_mart/Pages/mycartscreen.dart';
import 'package:veggie_mart/Services/AuthNotifier.dart';
import 'package:veggie_mart/Services/ProductAPI.dart';
import 'package:veggie_mart/Services/generalservices.dart';
import 'package:veggie_mart/Widgets/signinupwidgets.dart';
import 'package:veggie_mart/model/User.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  InputController inputController=new InputController();
  Users _user = Users();


  forSignin() async {
    _user.email = inputController.email.text;
    _user.password = inputController.password.text;
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
      login(_user, authNotifier);
  }
  
  forForgotPassword(){
    print("Forgot yaar");
  }

  forSignup(){
    print("sending data for sign In");
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    print("Go to signup");
    signup(_user, authNotifier);
    Navigator.pushReplacement(context,
      MaterialPageRoute(
          builder: (context) => SignUpScreen()),
    );
  }

  @override
  void initState(){
    onlyPortraitMode();
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
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
                          padding: EdgeInsets.only(top: 30,bottom: 10),
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Text(
                          'Sign in to your account',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        EmailInput(inputController.email),
                        PasswordInput(inputController.password),
                        Padding(
                          padding: EdgeInsets.only(top:12.0,right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [HyperLink('Forgot Password?', forForgotPassword)],
                          ),
                        ),
                        SubmitButton('Sign in', forSignin),
                        SigninAlternative('in'),
                        Padding(
                          padding: EdgeInsets.only(top:10.0,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    fontSize: 18,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                              HyperLink('Sign up now!', forSignup)
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

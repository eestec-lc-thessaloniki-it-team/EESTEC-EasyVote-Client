import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'voting.dart';

void main() => runApp(EestecVoting());

class EestecVoting extends StatefulWidget {
  @override
  _EestecVotingState createState() => _EestecVotingState();

}

class _EestecVotingState extends State<EestecVoting> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginChoice(),
      title: 'EESTEC Voting',
      debugShowCheckedModeBanner: false,
      // Set Raleway as the default app font
      theme: ThemeData(
        //fontFamily: 'Roboto',
        primaryColor: Colors.red
      ),
    );
  }
}

class LoginChoice extends StatefulWidget {
  @override
  _LoginChoiceState createState() => _LoginChoiceState();
}

class _LoginChoiceState extends State<LoginChoice> {
  var _rememberMe = false;
  
  void _rememberMeChange(bool value) => setState(() => _rememberMe = value);
  @override
  Widget build(BuildContext context) {
    final _eestecImage = AssetImage('assets/eesteclogo.png');
    final _eestecLogo = Image(image: _eestecImage, width: 170, height: 140,);

    final _email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: "Email",
        contentPadding: EdgeInsets.fromLTRB(20, 13, 20, 13),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),
    );

    final _password = TextFormField(
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Password",
        contentPadding: EdgeInsets.fromLTRB(20, 13, 20, 13),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
    );

    final _forgotLabel = FlatButton(
      onPressed: () => { },
      child: Text(
        "Forgot Password?",
        style: TextStyle(color: Color(0XFFEB2426), fontSize: 16, fontFamily: "Poppins-Medium"),  
      ),
    );

    final _rememberMeCheckbox = CheckboxListTile(
      value: _rememberMe,
      onChanged: _rememberMeChange,
      title: Text("Remember Me", style: TextStyle(fontSize: 13),),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color(0XFFEB2426),
      );

    final _formCard = Padding(
      padding: EdgeInsets.fromLTRB(20, 17, 20, 17),
      child: Container( 
        //height: 290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 15),
              blurRadius: 15,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -10),
              blurRadius: 10
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Login", style: TextStyle(fontSize: 24, fontFamily: "Poppins-Bold", letterSpacing: .6),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: _email
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: _password,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _forgotLabel
                ],
              )
            ],
          ),
        ),
      )
    );

    

    final _loginButton = RaisedButton(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      onPressed: () => {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => VotingView()))  
      },
      padding: EdgeInsets.all(20),
      color: Color(0XFFEB2426),
      child: Text("Sign In", style:  TextStyle(color: Colors.white, fontSize: 16),),
    );

    final _signUpButton = FlatButton(
      onPressed: () => { },
      child: Text(
        "Sign Up",
        style: TextStyle(color: Color(0XFFEB2426), fontSize: 13, fontFamily: "Poppins-Medium"),  
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _eestecLogo
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: _formCard)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Padding(padding: EdgeInsets.all(15),child: _rememberMeCheckbox,)),
                  Expanded(child: Padding(padding: EdgeInsets.all(20),child: _loginButton,)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: _signUpButton
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
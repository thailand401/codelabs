import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:codelabs/welcomePage.dart';

class CheckingPage extends StatefulWidget {
  CheckingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CheckingPagePageState createState() => _CheckingPagePageState();
}

class _CheckingPagePageState extends State<CheckingPage> {
  bool isLoading = false;

  Widget _label() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Welcome to Food Delivery',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Image(
                image: AssetImage('assets/resource/icon.png'),
                width: 80,
                height: 80),
            SizedBox(
              height: 20,
            ),
            new InkWell(
              child: new Text(
                'Join Us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () => launch('https://google.com')
            ),
          ],
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'sh',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'j',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'pr',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _checkingButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Continue',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration.zero, () => _showAlert(context));
    //_loginAction();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff348F50), Color(0xff56B4D3)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 80,
              ),
              _checkingButton(),
              _label()
            ],
          ),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<void> _loginAction() async {
    //print(DateTime.now().millisecondsSinceEpoch);
    setState(() {
      isLoading = true;
    });
    await new Future.delayed(const Duration(seconds: 5));
    if (isLoading == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }
  }
  @override
  void initState() {
    super.initState();
  }
}

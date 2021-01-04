import 'package:flutter/material.dart';
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
            Icon(Icons.delivery_dining, size: 100, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Join Us',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
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

  @override
  Widget build(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
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
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 80,
              ),
              _label()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    this._loginAction();
    Navigator.pop(context);

    if (isLoading == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }
  }

  Future<void> _loginAction() async {
    //print(DateTime.now().millisecondsSinceEpoch);
    await new Future.delayed(const Duration(seconds: 5));
    setState(() {
      isLoading = false;
    });
  }
}

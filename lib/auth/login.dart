import 'package:flutter/material.dart';
import 'package:srms/constants/colors.dart';
import 'package:srms/constants/units.dart';
import 'package:srms/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int defaultChoiceIndex = 0;
  List<String> _choicesList = ['Student', 'Teacher'];

  var deco = InputDecoration(
    filled: true,
    fillColor: ColorConsts.white,
    labelStyle: TextStyle(color: Colors.grey),
    // hintText: 'Enter Username',
    hintStyle: TextStyle(
      color: Colors.grey.shade600,
      fontSize: 16,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Units.width(context) * 0.06,
                  vertical: Units.height(context) * 0.04),
              width: Units.width(context) * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage('images/akg-logo.png'),
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Ajay Kumar Garg Engineering College',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Student Result Portal',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Units.height(context) * 0.05,
                        horizontal: Units.width(context) * 0.08),
                    padding: EdgeInsets.symmetric(
                        vertical: Units.height(context) * 0.05,
                        horizontal: Units.width(context) * 0.05),
                    width: Units.width(context) / 3,
                    child: Column(
                      children: [
                        Text(
                          'WELCOME',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorConsts.darkYellow,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Sign in to continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          cursorColor: Colors.black,
                          cursorWidth: 1.5,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: deco.copyWith(hintText: 'Username'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          cursorColor: Colors.black,
                          cursorWidth: 1.5,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: deco.copyWith(hintText: 'Password'),
                        ),
                        SizedBox(height: 25),
                        Wrap(
                          spacing: 50,
                          children: List.generate(_choicesList.length, (index) {
                            return ChoiceChip(
                              labelPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              label: Text(
                                _choicesList[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 14),
                              ),
                              selected: defaultChoiceIndex == index,
                              selectedColor: ColorConsts.yellow,
                              onSelected: (value) {
                                setState(() {
                                  defaultChoiceIndex =
                                      value ? index : defaultChoiceIndex;
                                });
                              },
                              // backgroundColor: color,
                              elevation: 1,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                            );
                          }),
                        ),
                        SizedBox(height: 30),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => HomePage()));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.all(Units.height(context) * 0.02),
                            width: Units.width(context) / 3,
                            padding: EdgeInsets.symmetric(
                                vertical: Units.height(context) * 0.02,
                                horizontal: Units.width(context) * 0.04),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorConsts.dark),
                            alignment: Alignment.center,
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Units.width(context) * 0.4,
              child: Image(
                image: AssetImage('images/login-pic.png'),
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}

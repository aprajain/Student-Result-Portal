import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:srms/constants/colors.dart';
import 'package:srms/constants/units.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget customCard(label) {
    return Container(
      // margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: Units.width(context) * 0.2,
      // height: Units.height(context) * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConsts.green,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget noticeBoard() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(bottom: 15),
      width: Units.width(context) * 0.2,
      height: Units.height(context) * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 0.8)),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.red.shade600.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Row(
              children: [
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'NOTICES',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Text('No new notices to display.')
        ],
      ),
    );
  }

  Widget stats(tag, max, min, int percent) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: Units.width(context) * 0.12,
      // height: Units.height(context) * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConsts.dark.withOpacity(0.7),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Center(
            child: CircularPercentIndicator(
              radius: 35.0,
              backgroundColor: Colors.grey,
              lineWidth: 8.0,
              animation: true,
              percent: percent / 100,
              center: Text(
                percent.toString() + "%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.white),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: ColorConsts.green,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Average $tag Score',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Max Marks: $max',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            'Min Marks: $min',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: ColorConsts.paleYellow,
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 30,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(Units.width(context) * 0.02),
        padding: EdgeInsets.symmetric(
            vertical: Units.height(context) * 0.04,
            horizontal: Units.width(context) * 0.04),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello User!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Even Semester 2021-22',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  Container(
                    height: Units.height(context) * 0.35,
                    width: Units.width(context) * 0.35,
                    margin: EdgeInsets.symmetric(
                        vertical: Units.width(context) * 0.02),
                    //padding: EdgeInsets.all(Units.width(context) * 0.04),
                    decoration: BoxDecoration(
                      color: ColorConsts.blue,
                      //border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: AssetImage('images/study.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // SizedBox(height: 30),
                  Container(
                    // margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    width: Units.width(context) * 0.2,
                    // height: Units.height(context) * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConsts.yellow,
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Icon(
                          Icons.history,
                          size: 30,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'See Old Results',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customCard('Schedule for upcoming tests'),
                      SizedBox(width: 40),
                      customCard('Syllabus for upcoming tests'),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customCard('Download Admit Card'),
                      SizedBox(width: 40),
                      customCard('Find subject-wise notes'),
                    ],
                  ),
                  SizedBox(height: 30),

                  // SizedBox(height: 20),
                ],
              ),
              Spacer(),
              Container(
                // margin:
                //     EdgeInsets.symmetric(horizontal: Units.width(context) * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: Units.height(context) * 0.04,
                    horizontal: Units.width(context) * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  children: [
                    Text(
                      'LAST  TEST  STATISTICS',
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Class Test II',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Date: 22/11/21',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        stats('Class', '20', '3', 80),
                        SizedBox(width: 10),
                        stats('Branch', '23', '3', 76),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      width: Units.width(context) * 0.2,
                      // height: Units.height(context) * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConsts.dark,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Check Your Score',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      width: Units.width(context) * 0.2,
                      // height: Units.height(context) * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConsts.dark,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Compare Your Score',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

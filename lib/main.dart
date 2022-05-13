import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiztime/repo/api_call_repo.dart';
import 'package:quiztime/screens/section_list_view.dart';
import 'package:quiztime/model/data_section_model.dart';
import 'package:quiztime/screens/quizpage2.dart';
import 'package:quiztime/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);
        print(SizeConfig.heightMultiplier!);
        print(SizeConfig.widthMultiplier!);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quiz Time',
          home: Home(),
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  DataSectionModel? questionListModel;
void stat() async {

    final repo = ApiCallRepo().getQuiz();
    questionListModel = await repo;
    setState(() {
questionListModel=questionListModel;
    });
  }



  void navigate(category, title, context, imgurl, color,time,section) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QuizPage2(
            category: category, title: title, imgurl: imgurl, color: color,time:time,section:section)));
  }

  @override
  Widget build(BuildContext context) {
  stat();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[

            SizedBox(height: 3.22 * SizeConfig.heightMultiplier!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'QUIZ TIME!',
                  style: TextStyle(
                      fontSize: 5.5 * SizeConfig.textMultiplier!,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontFamily: 'Margarine',
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 1.1 * SizeConfig.heightMultiplier!),
    SectionListView(questionListModel:questionListModel!),


            SizedBox(height: 5.76 * SizeConfig.heightMultiplier!),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiztime/api_call_repo.dart';
import 'package:quiztime/question_list_model.dart';
import 'package:quiztime/quizpage2.dart';
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

  QuestionListModel? questionListModel;
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
        if(questionListModel!=null) ListView.builder(
    physics: const ClampingScrollPhysics(),
    shrinkWrap: true,
    itemCount: questionListModel!.data!.section!.length ,
    itemBuilder: (context, index) {
      if(questionListModel!=null){
      return  Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate(questionListModel!.data!.section![index].section_subject, questionListModel!.data!.section![index].section_name, context,
                        'assets/gk.jpg', Colors.red[300],questionListModel!.data!.test_duration,questionListModel!.data!.section![index]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.red[300],
                    shadowColor: Colors.red[900],
                    elevation: 8,
                    child: Column(children:[Row(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                          child: Text(questionListModel!.data!.section![index].section_subject!.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 3.64 * SizeConfig.textMultiplier!,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Acme')),
                        )),
                        Expanded(
                          child:Text("${questionListModel!.data!.test_duration.toString()} mins",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 3.64 * SizeConfig.textMultiplier!,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Acme')),

                        ),
                      ],
                    ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Center(
                                child: Text("${questionListModel!.data!.section![index].question!.length.toString()} questions",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 3.64 * SizeConfig.textMultiplier!,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Acme')),
                              )),
                          Expanded(
                            child:Text("Type : ${questionListModel!.data!.section![index].question![0].question_type}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3.64 * SizeConfig.textMultiplier!,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Acme')),

                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            );}else{return SizedBox();}}),


            SizedBox(height: 5.76 * SizeConfig.heightMultiplier!),
          ],
        ),
      ),
    );
  }
}

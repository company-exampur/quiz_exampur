import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiztime/model/data_section_model.dart';
import 'package:quiztime/screens/quizpage2.dart';

import 'package:quiztime/size_config.dart';

class SectionListView extends StatelessWidget {
 final  DataSectionModel questionListModel;
   SectionListView({Key? key, required this.questionListModel}) : super(key: key);
  void navigate(category, title, context, imgurl, color,time,section) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QuizPage2(
            category: category, title: title, imgurl: imgurl, color: color,time:time,section:section)));
  }

  @override
  Widget build(BuildContext context) {
    if(questionListModel!=null){
    return    ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: questionListModel.data!.section!.length ,
        itemBuilder: (context, index) {
          if(questionListModel!=null){
            return  Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate(questionListModel.data!.section![index].section_subject, questionListModel.data!.section![index].section_name, context,
                        'assets/gk.jpg', Colors.red[300],questionListModel.data!.test_duration,questionListModel.data!.section![index]);
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
                              child: Text(questionListModel.data!.section![index].section_subject!.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 3.64 * SizeConfig.textMultiplier!,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Acme')),
                            )),
                        Expanded(
                          child:Text("${questionListModel.data!.test_duration.toString()} mins",
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
                                child: Text("${questionListModel.data!.section![index].question!.length.toString()} questions",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 3.64 * SizeConfig.textMultiplier!,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Acme')),
                              )),
                          Expanded(
                            child:Text("Type : ${questionListModel.data!.section![index].question![0].question_type}",
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
            );}else{return SizedBox();}});
  }else{
     return SizedBox();
    }
    }
}

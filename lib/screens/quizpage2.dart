import 'package:flutter/material.dart';

import 'package:quiztime/model/data_section_model.dart';

import 'dart:async';
import 'package:quiztime/size_config.dart';
import '../model/question_model.dart';
import 'end.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';

class QuizPage2 extends StatefulWidget {
  final Section section;
  final String category;
  final String title;
  final String imgurl;
  final Color color;
  final int time;

  const QuizPage2(
      {Key? key,
      required this.category,
      required this.title,
      required this.imgurl,
      required this.color,
      required this.time,
      required this.section})
      : super(key: key);
  @override
  _QuizPage2State createState() => _QuizPage2State();
}

class _QuizPage2State extends State<QuizPage2> {
  int number = 0;
  int score = 0;
  List<bool> _correct = [];
  final _controller = CountDownController();
  int correctIndex = 90;
  List<Question> _questions = [];
  @override
  void initState() {
    super.initState();

    _questions = widget.section.question!;
    _questions.shuffle();
  }

  void dispose() {
    super.dispose();
  }

  String? correct;
  void quesno(context, _questions, color) {
    if (number < _questions.length - 1) {
      setState(() {
        number++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => End(widget.title, score, color,widget.section.question!.length.toString())));
    }
  }

  Future<bool> back(context) async {
    return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Exit Quiz'),
                content: Text('Do you want to exit this quiz?'),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('YES')),
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('NO')),
                ],
              );
            }) ??
        false;
  }

  int onpress = 0, pressed = 0;
  late Color colornew;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => back(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 3.1 * (SizeConfig.textMultiplier!),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          titleSpacing: 1,
          backgroundColor: widget.color,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.imgurl), fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 8.5 * SizeConfig.heightMultiplier!,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _questions.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 2.3 * SizeConfig.textMultiplier!,
                            fontWeight: FontWeight.bold,
                            color: widget.color,
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _correct.length != index
                              ? Color.fromRGBO(0, 0, 0, 0.8)
                              : Colors.yellow,
                          border: _correct.length > index
                              ? Border.all(
                                  width: 0.6 * SizeConfig.widthMultiplier!,
                                  color: Colors.yellow)
                              : null,
                        ),
                        width: 9.12 * SizeConfig.widthMultiplier!,
                        height: 5.12 * SizeConfig.heightMultiplier!,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                          width: 0.85 * SizeConfig.widthMultiplier!);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CountDownProgressIndicator(
                      controller: _controller,
                      timeTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          fontWeight: FontWeight.bold),
                      valueColor: Colors.red,

                      backgroundColor: Colors.grey,
                      initialPosition: 0,
                      duration: widget.time,
                      // timeFormatter: (seconds) {
                      //   return Duration(seconds: seconds)
                      //     .toString()
                      //   .split('.')[0]
                      // .padLeft(8, '0');
                      //},
                      // text: //'hh:mm:ss',
                      // 'sec',
                      onComplete: () {
                        //_controller.pause();

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                End(widget.title, score, widget.color,widget.section.question!.length.toString())));
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        shadowColor: Color.fromRGBO(0, 0, 0, 0.8),
                        elevation: 8,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _questions[number].question_name!,
                              style: TextStyle(
                                  color: widget.color,
                                  fontSize: 3.5 * SizeConfig.textMultiplier!,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    /*_questions[number].question_image!=null?Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          _questions[number].question_image!,

                        ),
                      ),
                    ):SizedBox(),*/
                    SizedBox(height: 3.1 * SizeConfig.heightMultiplier!),
                    ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            widget.section.question![number].options!.length,
                        itemBuilder: (context, index) {
                          if (widget.section.question![number].options !=
                              null) {
                            return Column(children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    onPressed: () {
                                      pressed = 1;
                                      onpress = index;
                                      for (int i = 0; i < 4; i++) {
                                        if (_questions[number]
                                                .options![i]
                                                .is_true ==
                                            true) {
                                          correctIndex = i;
                                          setState(() {
                                            correct = _questions[number]
                                                .options![i]
                                                .option_name;
                                          });
                                        } else {
                                          setState(() {});
                                          // (onpress==1)?(correct==_questions[number].options![index].option_name) ?Colors.green:Colors.red:Color.fromRGBO(51, 51, 51, 0.9);
                                        }
                                      }

                                      if (_questions[number]
                                              .options![index]
                                              .option_name ==
                                          correct) {
                                        setState(() {
                                          score++;
                                        });
                                      }

                                      //  quesno(context, _questions, widget.color);
                                    },
                                    child: Text(
                                      '${index + 1}.    ' +
                                          _questions[number]
                                              .options![index]
                                              .option_name!,
                                      style: TextStyle(
                                          color: widget.color,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              2.3 * SizeConfig.textMultiplier!),
                                      textAlign: TextAlign.center,
                                    ),
                                    color: pressed == 1
                                        ? correctIndex == index
                                            ? Colors.green
                                            : index == onpress
                                                ? correct ==
                                                        _questions[number]
                                                            .options![index]
                                                            .option_name
                                                    ? Colors.green
                                                    : Colors.red
                                                : Color.fromRGBO(
                                                    51, 51, 51, 0.9)
                                        : Color.fromRGBO(51, 51, 51, 0.9),
                                  )),
                              /*_questions[number].options![index].option_image!=null? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Image.asset(  _questions[number].options![index].option_image!)
                          ):SizedBox()*/
                            ]);
                          } else {
                            return SizedBox();
                          }
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    pressed == 1
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              color: Color.fromRGBO(51, 51, 51, 0.9),
                              elevation: 8,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Answer : ${_questions[number].solution![0].solution_name!}",
                                    style: TextStyle(
                                        color: widget.color,
                                        fontSize:
                                            2.3 * SizeConfig.textMultiplier!,
                                        fontWeight: FontWeight.w800),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    /*pressed == 1
                        ? _questions[number].solution![0].solution_image != null
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  _questions[number].question_image!,
                                ),
                              ))
                            : SizedBox()
                        : SizedBox(),*/
                  ]),
                ),
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  onPressed: () {
                    pressed = 0;

                    _correct.add(false);
                    quesno(context, _questions, widget.color);
                  },
                  child: Text(
                    'NEXT QUESTION',
                    style: TextStyle(
                        color: widget.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * SizeConfig.textMultiplier!),
                    textAlign: TextAlign.center,
                  ),
                  color: Color.fromRGBO(51, 51, 51, 0.9)),
              SizedBox(height: 0.4 * SizeConfig.heightMultiplier!),
              SizedBox(height: 0.1 * SizeConfig.heightMultiplier!),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:simple_form_arm/form_builder.dart';
import 'package:simple_form_arm/src/shared/questionsModel.dart';
import 'package:simple_form_arm/src/shared/finalAnswers.dart';
import 'package:simple_form_arm/src/shared/constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FormBuilder Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                initialData: sampleData,
                title: "Form title",
                titleStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                description: "description",
                widgetCrossAxisAlignment: CrossAxisAlignment.center,
                index: 0,
                showIndex: false,
                descriptionTextDecoration: TextStyle(color: Colors.red),
                submitButtonWidth: 1,
                submitButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                ),
                showIcon: false,
                onSubmit: (QuestionsModel? val) {
                  if (val == null) {
                    // question();
                    print("no data");
                  } else {
                    submit(jsonEncode(val.questions));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> coordinate = {
    "provinsi": "Jawa Barat",
    "kabkot": "Bekasi",
    "kecamatan": "Teluk",
    "deskel": "teluk",
    "lat": "78482738472",
    "lng": "u2i3u4i2"
  };

  submit(dynamic answer) {
    FinalCoordinate koordata = FinalCoordinate.fromJson((coordinate));
    var list = jsonDecode(answer) as List;
    List<FinalAnswers> answer2 =
        list.map((i) => FinalAnswers.fromJson(i)).toList();
    FinalAnswerModel questionsModel =
        FinalAnswerModel(answers: answer2, coordinate: koordata);
    print(questionsModel.toJson());
  }

  // question() {
  //   var json = jsonEncode(sampleData3);
  //   List<Question> question = Question.fromJson(sampleData3) as List;

  //   QuestionsModel questionsModel = QuestionsModel(questions: question);

  //   var dataq = questionsModel.toJson();

  //   // return dataq;

  //   dataSample4.addAll(dataq);

  //   // print(dataq);
  // }
}

import 'package:flutter/material.dart';
import 'package:simple_form_arm/src/shared/questionsModel.dart';

QuestionsModel? getCompleteData({
  required BuildContext context,
  required int index,
  Question? questions,
  QuestionsModel? checklistModel,
}) {
  int f = 0;
  List<Question>? questions = checklistModel!.questions;

  for (Question item in questions!) {
    if (item.content == null && item.questionType != "devider") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${item.question} is mandatory"),
        ),
      );

      f = 1;
      break;
    }
    // {
    //   print(item.answer);
    // }
  }

  return f == 0 ? checklistModel : null;
}

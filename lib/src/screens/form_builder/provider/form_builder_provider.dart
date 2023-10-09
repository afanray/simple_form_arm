import 'package:flutter/cupertino.dart';
// import 'package:simple_form_builder/src/shared/checklistModel2.dart';

import '../../../shared/questionsModel.dart';

class FormBuilderProvider extends ChangeNotifier {
  Map<String, dynamic> initial;
  List multipleSelected = [];

  QuestionsModel? questionsModel;
  // ChecklistModel? checklistModel;

  FormBuilderProvider({required this.initial}) {
    questionsModel = QuestionsModel.fromJson(initial);
  }

  void setAnswer(
      {required Question questions, Object? value, required int index}) {
    final idx = questionsModel?.questions?.indexOf(questions);
    final question = questionsModel?.questions?[idx!];
    question?.content = value;

    // print(question?.answer);

    notifyListeners();
  }

  // void setMultiAnswer(
  //     {required Question questions, Object? value, required int index}) {
  //   final idx = questionsModel?.questions?.indexOf(questions);
  //   final question = questionsModel?.questions?[idx!];
  //   question?.content = value;

  //   print(question?.content);

  //   notifyListeners();
  // }

  // void setRemark(Answer questions, String? value, int index) {
  //   final idx = questionsModel?.answers?.indexOf(questions);
  //   final question = questionsModel?.answers?[idx!];
  //   question?.remarkData = value;

  //   notifyListeners();
  // }

  void setCheckboxAnswers(
      {required Question questions,
      bool? input,
      required String? checked,
      required int index,
      Object? value}) {
    final idx = questionsModel?.questions?.indexOf(questions);
    final question = questionsModel?.questions?[idx!];

    question?.content[questions.answerOptions!
        .indexOf(questions.answerOptions!.elementAt(index))] = input;

    if (input == false) {
      multipleSelected.remove(checked);
    } else {
      multipleSelected.add(checked);
    }

    print(multipleSelected);

    notifyListeners();
  }
}

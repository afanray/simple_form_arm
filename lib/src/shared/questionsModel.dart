// ignore_for_file: file_names, prefer_typing_uninitialized_variables

class QuestionsModel {
  List<Question>? questions;

  QuestionsModel({
    this.questions,
  });

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    questions = json["questionare"] == null
        ? []
        : List<Question>.from(
            json["questionare"]!.map((x) => Question.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["questionare"] = questions == null
        ? []
        : List<dynamic>.from(questions!.map((x) => x.toJson()));
    return data;
  }
}

class RepeatEnds {
  String? value;

  RepeatEnds({this.value});

  RepeatEnds.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    return data;
  }
}

class Question {
  String? id;
  String? questionType;
  String? question;
  List<AnswerOption>? answerOptions;
  var content;

  Question(
      {this.id,
      this.questionType,
      this.question,
      this.answerOptions,
      this.content});

  Question.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    questionType = json["question_type"];
    question = json["question"];

    answerOptions = List<AnswerOption>.from(
        json["answer_options"].map((x) => AnswerOption.fromJson(x)));

    // answerOptions = json["answer_options"] == null
    //     ? []
    //     : List<dynamic>.from(json["answer_options"]!.map((x) => x));
    // content = json["content"];

    if (questionType == "checkbox") {
      content = List.generate(answerOptions!.length, (index) => false);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["questionare_id"] = id;
    data["question_type"] = questionType;
    data['content'] = content.toString();

    return data;
  }
}

class AnswerOption {
  String? id;
  String? option;

  AnswerOption({
    this.id,
    this.option,
  });

  AnswerOption.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    option = json["option"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "option": option,
      };
}

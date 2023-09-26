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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["questionare"] = this.questions == null
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["questionare_id"] = this.id;
    data["question_type"] = this.questionType;
    data['content'] = this.content.toString();

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
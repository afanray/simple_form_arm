class FinalAnswerModel {
  FinalCoordinate? coordinate;
  List<FinalAnswers>? answers;

  FinalAnswerModel({this.coordinate, this.answers});

  FinalAnswerModel.fromJson(Map<String, dynamic> json) {
    coordinate = json['coordinate'] != null
        ? FinalCoordinate.fromJson(json['coordinate'])
        : null;
    if (json['answers'] != null) {
      answers = <FinalAnswers>[];
      json['answers'].forEach((v) {
        answers!.add(FinalAnswers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coordinate != null) {
      data['coordinate'] = coordinate!.toJson();
    }
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FinalCoordinate {
  String? provinsi;
  String? kabkot;
  String? kecamatan;
  String? deskel;
  String? lat;
  String? lng;

  FinalCoordinate(
      {this.provinsi,
      this.kabkot,
      this.kecamatan,
      this.deskel,
      this.lat,
      this.lng});

  FinalCoordinate.fromJson(Map<String, dynamic> json) {
    provinsi = json['provinsi'];
    kabkot = json['kabkot'];
    kecamatan = json['kecamatan'];
    deskel = json['deskel'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provinsi'] = provinsi;
    data['kabkot'] = kabkot;
    data['kecamatan'] = kecamatan;
    data['deskel'] = deskel;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class FinalAnswers {
  String? questionareId;
  String? questionType;
  String? content;

  FinalAnswers({this.questionareId, this.questionType, this.content});

  FinalAnswers.fromJson(Map<String, dynamic> json) {
    questionareId = json['questionare_id'];
    questionType = json['question_type'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionare_id'] = questionareId;
    data['question_type'] = questionType;
    data['content'] = content;
    return data;
  }
}

class FinalAnswerModel {
  FinalCoordinate? coordinate;
  List<FinalAnswers>? answers;

  FinalAnswerModel({this.coordinate, this.answers});

  FinalAnswerModel.fromJson(Map<String, dynamic> json) {
    coordinate = json['coordinate'] != null
        ? new FinalCoordinate.fromJson(json['coordinate'])
        : null;
    if (json['answers'] != null) {
      answers = <FinalAnswers>[];
      json['answers'].forEach((v) {
        answers!.add(new FinalAnswers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate!.toJson();
    }
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provinsi'] = this.provinsi;
    data['kabkot'] = this.kabkot;
    data['kecamatan'] = this.kecamatan;
    data['deskel'] = this.deskel;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionare_id'] = this.questionareId;
    data['question_type'] = this.questionType;
    data['content'] = this.content;
    return data;
  }
}

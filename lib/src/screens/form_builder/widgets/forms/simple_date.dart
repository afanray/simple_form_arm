part of 'question_widget.dart';

class _SimpleDate extends StatelessWidget {
  const _SimpleDate({
    Key? key,
    required this.questions,
    this.checklistModel,
    required this.showIndex,
    required this.index,
  }) : super(key: key);

  final Question questions;
  final QuestionsModel? checklistModel;
  final bool showIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                    "${showIndex ? "${checklistModel!.questions!.indexOf(questions) + 1}. " : ""}${questions.question}"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: <Widget>[
              Theme(
                data: ThemeData(),
                child: Builder(
                  builder: (context) => Consumer<FormBuilderProvider>(
                    builder: (context, value, child) {
                      return CustomDropdown(
                        onChanged: (val) {
                          // print(val);
                        },
                        onTap: () async {
                          DateTime tempDate = await selectDate(context);

                          if (questions.content == null) {
                            value.setAnswer(
                              questions: questions,
                              value: tempDate,
                              index: index,
                            );
                          } else {
                            value.setAnswer(
                              questions: questions,
                              value: DateTime(
                                tempDate.year,
                                tempDate.month,
                                tempDate.day,
                                questions.content.hour,
                                questions.content.minute,
                              ),
                              index: index,
                            );
                          }
                        },
                        title: questions.content == null
                            ? "DD-MM-YYYY"
                            : dateFormater.format(questions.content),
                        // date != null ? dateFormater.format(date) : "DD-MM-YYYY",
                        showImage: false,
                        isRequired: false,
                        width: screenWidth(context: context, mulBy: 0.4),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

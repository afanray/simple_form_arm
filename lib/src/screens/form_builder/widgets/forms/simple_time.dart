part of 'question_widget.dart';

class _SimpleTime extends StatelessWidget {
  const _SimpleTime({
    Key? key,
    required this.questions,
    this.checklistModel,
    required this.showIndex,
    this.dateImage,
    this.remarkImage,
    required this.index,
    required this.showIcon,
    this.descriptionTextDecoration,
  }) : super(key: key);

  final Question questions;
  final QuestionsModel? checklistModel;
  final bool showIndex;
  final String? dateImage;
  final String? remarkImage;
  final int index;
  final bool showIcon;
  final TextStyle? descriptionTextDecoration;

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
              showIcon ? IconContainer(icon: dateImage) : Container(),
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
              Consumer<FormBuilderProvider>(
                builder: (context, value, child) {
                  return CustomDropdown(
                    onChanged: (val) {},
                    onTap: () async {
                      TimeOfDay tempTime = await selectTime(context);

                      if (questions.content == null) {
                        value.setAnswer(
                          questions: questions,
                          value: DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            tempTime.hour,
                            tempTime.minute,
                          ),
                          index: index,
                        );
                      } else {
                        value.setAnswer(
                          questions: questions,
                          value: DateTime(
                            questions.content.year,
                            questions.content.month,
                            questions.content.day,
                            tempTime.hour,
                            tempTime.minute,
                          ),
                          index: index,
                        );
                      }
                      // reminderController.updateIschanged(true);
                    },
                    title: questions.content != null
                        ? formatTimeOfDay(
                            TimeOfDay.fromDateTime(questions.content))
                        : "Hr:Mins",
                    showImage: false,
                    isRequired: false,
                    width: screenWidth(context: context, mulBy: 0.3),
                  );
                },
              ),
            ],
          ),
        ),
        // Consumer<FormBuilderProvider>(
        //   builder: ((context, value, child) {
        //     return _RemarkWidget(
        //       questions: questions,
        //       remark: showIcon,
        //       icon: remarkImage,
        //       onChanged: (input) {
        //         value.setRemark(questions, input, index);
        //       },
        //     );
        //   }),
        // ),
      ],
    );
  }
}

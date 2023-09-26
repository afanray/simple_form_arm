part of 'question_widget.dart';

class _SimpleMultiple extends StatelessWidget {
  const _SimpleMultiple({
    Key? key,
    required this.questions,
    required this.showIcon,
    required this.showIndex,
    required this.index,
    this.checklistModel,
    this.descriptionTextDecoration,
    this.multipleimage,
    this.titleTextDecoration,
    this.remarkImage,
  }) : super(key: key);

  final Question questions;
  final QuestionsModel? checklistModel;
  final bool showIcon;
  final bool showIndex;
  final int index;
  final TextStyle? descriptionTextDecoration;
  final String? multipleimage;
  final TextStyle? titleTextDecoration;
  final String? remarkImage;

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
              showIcon ? IconContainer(icon: multipleimage) : Container(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "${showIndex ? "${checklistModel!.questions!.indexOf(questions) + 1}. " : ""}${questions.question}",
                  style: titleTextDecoration ?? const TextStyle(),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: questions.answerOptions!
              .map(
                (val) => Consumer<FormBuilderProvider>(
                  builder: (context, value, child) {
                    return RadioListTile(
                      value: val.option.toString(),
                      groupValue: questions.content,
                      title: Text(
                        val.option!.toString(),
                        style: TextStyle(
                            color: questions.content != val
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      onChanged: (input) {
                        value.setAnswer(
                          questions: questions,
                          value: input,
                          index: index,
                        );
                      },
                    );
                  },
                ),
              )
              .toList(),
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

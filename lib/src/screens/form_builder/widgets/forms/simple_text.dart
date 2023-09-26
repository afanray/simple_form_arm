part of 'question_widget.dart';

class _SimpleText extends StatelessWidget {
  const _SimpleText({
    Key? key,
    required this.questions,
    this.checklistModel,
    required this.showIndex,
    this.textImage,
    this.remarkImage,
    required this.index,
    required this.showIcon,
    this.descriptionTextDecoration,
    this.textFieldWidth,
    this.textfieldDecoration,
  }) : super(key: key);

  final Question questions;
  final QuestionsModel? checklistModel;
  final bool showIndex;
  final String? textImage;
  final String? remarkImage;
  final int index;
  final bool showIcon;
  final TextStyle? descriptionTextDecoration;
  final double? textFieldWidth;
  final InputDecoration? textfieldDecoration;

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
              showIcon ? IconContainer(icon: textImage) : Container(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                    "${showIndex ? "${checklistModel!.questions!.indexOf(questions) + 1}. " : ""}${questions.question}"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16,
          ),
          child: SizedBox(
            width: screenWidth(
                context: context,
                mulBy: textFieldWidth ?? 0.9),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<FormBuilderProvider>(
                  builder: (context, value, child) {
                    return TextField(
                      maxLines: 1,
                      onChanged: (input) {
                        value.setAnswer(
                          questions: questions,
                          value: input,
                          index: index,
                        );
                      },
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: textfieldDecoration ??
                          const InputDecoration.collapsed(
                            hintText: "Enter text here",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                    );
                  },
                ),
              ),
            ),
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

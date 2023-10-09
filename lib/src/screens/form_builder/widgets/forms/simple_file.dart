part of 'question_widget.dart';

class _SimpleFile extends StatelessWidget {
  const _SimpleFile({
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                    "${showIndex ? "${checklistModel!.questions!.indexOf(questions) + 1}. " : ""}${questions.question}"),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 150,
                        width: screenWidth(context: context, mulBy: 0.9),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueAccent)),
                        child: Consumer<FormBuilderProvider>(
                          builder: (context, value, child) {
                            return TextButton(
                                onPressed: () => fileUpload(
                                    context: context,
                                    files: (files) {
                                      value.setAnswer(
                                        questions: questions,
                                        value: files,
                                        index: index,
                                      );
                                    }),
                                child: (questions.content == null)
                                    ? Icon(
                                        Icons.add_a_photo_rounded,
                                        color: Colors.blueGrey,
                                        size: 35,
                                      )
                                    : Image.memory(
                                        base64Decode(questions.content),
                                        fit: BoxFit.fitWidth,
                                      ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

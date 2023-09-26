part of 'question_widget.dart';

class _SimpleFile extends StatelessWidget {
  const _SimpleFile({
    Key? key,
    required this.questions,
    this.checklistModel,
    required this.showIndex,
    this.remarkImage,
    required this.index,
    required this.showIcon,
    this.descriptionTextDecoration,
  }) : super(key: key);

  final Question questions;
  final QuestionsModel? checklistModel;
  final bool showIndex;
  final String? remarkImage;
  final int index;
  final bool showIcon;
  final TextStyle? descriptionTextDecoration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16),
              child: Container(
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
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.grey[500],
                                size: 70,
                              ),
                            );
                          },
                        ),
                      ),
                      questions.content != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 15,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                // Center(
                //   child: Consumer<FormBuilderProvider>(
                //     builder: (context, value, child) {
                //       return TextButton(
                //         onPressed: () => fileUpload(
                //             context: context,
                //             files: (files) {
                //               value.setAnswer(
                //                 questions: questions,
                //                 value: files,
                //                 index: index,
                //               );
                //             }),
                //         child: Text(
                //           "Upload",
                //           style: TextStyle(
                //             color: Colors.black,
                //             decoration: TextDecoration.underline,
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // )
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

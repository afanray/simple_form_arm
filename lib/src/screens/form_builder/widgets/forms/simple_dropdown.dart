part of 'question_widget.dart';

class _SimpleDropdown extends StatelessWidget {
  const _SimpleDropdown({
    Key? key,
    required this.questions,
    required this.showIndex,
    required this.index,
    this.checklistModel,
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
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24,
          ),
          child: Container(
            width: screenWidth(context: context, mulBy: 0.9),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: questions.content != null ? Colors.blue : Colors.grey,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<FormBuilderProvider>(
                builder: ((context, value, child) {
                  return DropdownButton(
                    underline: const SizedBox(),
                    hint: questions.content == null
                        ? const Text('Select option')
                        : Text(
                            questions.content,
                            style: TextStyle(
                              color: questions.content != null
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                    isExpanded: true,
                    iconSize: 30.0,
                    style: const TextStyle(color: Colors.grey),
                    items: questions.answerOptions!.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val.option,
                          child: Text(val.option!),
                        );
                      },
                    ).toList(),
                    onChanged: (input) {
                      value.setAnswer(
                        questions: questions,
                        value: input,
                        index: index,
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

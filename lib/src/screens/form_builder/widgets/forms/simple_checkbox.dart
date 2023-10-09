part of 'question_widget.dart';

class _SimpleCheckbox extends StatelessWidget {
  const _SimpleCheckbox({
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
        Column(
          children: questions.answerOptions!
              .map(
                (checked) => Consumer<FormBuilderProvider>(
                  builder: (context, value, child) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      title: Text(
                        checked.option.toString(),
                        style: TextStyle(
                            color: questions.content[questions.answerOptions!
                                        .indexOf(checked)] !=
                                    true
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      value: questions
                          .content[questions.answerOptions!.indexOf(checked)],
                      onChanged: (input) {
                        questions.content[
                            questions.answerOptions!.indexOf(checked)] = input;

                        value.setCheckboxAnswers(
                          questions: questions,
                          input: input,
                          checked: checked.option!,
                          index: index,
                        );
                      },
                    );
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

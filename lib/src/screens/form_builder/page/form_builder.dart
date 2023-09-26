// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_form_arm/src/screens/form_builder/provider/form_builder_provider.dart';
import 'package:simple_form_arm/src/screens/form_builder/widgets/forms/question_widget.dart';
import 'package:simple_form_arm/src/shared/questionsModel.dart';
import 'package:simple_form_arm/src/shared/utils/get_completed_data.dart';

class FormBuilder extends StatefulWidget {
  final Map<String, dynamic> initialData;

  final InputDecoration? textfieldDecoration;
  final String? title;
  final TextStyle? titleStyle;
  final CrossAxisAlignment widgetCrossAxisAlignment;
  final String? description;
  final TextStyle? descriptionStyle;
  final bool showIndex;
  final String? multipleimage,
      dropdownImage,
      dateImage,
      textImage,
      checkboxImage,
      remarkImage,
      submitButtonText;
  final int index;
  final double? textFieldWidth;
  final bool showIcon;
  final Function(QuestionsModel? value) onSubmit;
  final double? submitButtonWidth;
  final BoxDecoration? submitButtonDecoration;
  final TextStyle? submitTextDecoration;
  final TextStyle? titleTextDecoration;
  final TextStyle? descriptionTextDecoration;

  const FormBuilder({
    super.key,
    required this.initialData,
    required this.index,
    this.textfieldDecoration, //adds inputdecoration to textfields
    this.textFieldWidth, //to change the width of textField
    this.multipleimage, //adds  icon for case 'multiple'
    this.dropdownImage, //adds  icon for case 'dropdown'
    this.checkboxImage, //adds  icon for case 'checkbox'
    this.dateImage, //adds  icon for case 'date'
    this.textImage, //adds  icon for case 'text'
    this.remarkImage, //adds icon for remarks
    this.submitButtonText,
    this.showIcon = false, //to enable or disable question icon
    required this.onSubmit,
    this.showIndex = true,
    this.submitButtonDecoration,
    this.submitButtonWidth = 0.5,
    this.submitTextDecoration,
    this.title,
    this.description,
    this.descriptionStyle,
    this.titleStyle,
    this.widgetCrossAxisAlignment = CrossAxisAlignment.start,
    this.titleTextDecoration,
    this.descriptionTextDecoration,
  });

  @override
  _FormBuilderState createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormBuilderProvider(initial: widget.initialData),
      builder: (context, child) {
        final checklistModel =
            context.read<FormBuilderProvider>().questionsModel;

        return Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: widget.widgetCrossAxisAlignment,
              children: [
                widget.title != null
                    ? Text(
                        widget.title!,
                        style: widget.titleStyle ?? const TextStyle(),
                      )
                    : const SizedBox.shrink(),
                ...checklistModel!.questions!
                    .map((question) => QuestionWidget(
                          questions: question,
                          remarks: widget.showIcon,
                          widget: widget,
                          checklistModel: checklistModel,
                        ))
                    .toList(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // print("Back");
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              widget.submitButtonText ?? "Cancel",
                              style: widget.submitTextDecoration ??
                                  const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      InkWell(
                        onTap: () {
                          widget.onSubmit(getCompleteData(
                            context: context,
                            index: widget.index,
                            checklistModel: checklistModel,
                          ));
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              widget.submitButtonText ?? "Submit",
                              style: widget.submitTextDecoration ??
                                  const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

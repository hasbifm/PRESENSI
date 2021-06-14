import 'package:flutter/material.dart';

class PresensiForm extends StatelessWidget {
  final String taskPlan;
  final String note;
  final ValueChanged<String> onChangedTaskPlan;
  final ValueChanged<String> onChangedNote;
  final VoidCallback onSaved;
  final VoidCallback onCancel;

  const PresensiForm(
      {Key key,
      this.taskPlan = "",
      this.note = "",
      this.onChangedTaskPlan,
      this.onChangedNote,
      this.onSaved,
      this.onCancel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          widgetBuildTaskPlan(),
          widgetBuildNote(),
          widgetBuildButton(),
        ],
      ),
    );
  }

  widgetBuildTaskPlan() {
    return TextFormField(
      initialValue: taskPlan,
      onChanged: onChangedTaskPlan,
      maxLines: 1,
      decoration: InputDecoration(
          border: UnderlineInputBorder(), labelText: "Task Plan"),
    );
  }

  widgetBuildNote() {
    return TextFormField(
      initialValue: note,
      onChanged: onChangedNote,
      maxLines: 1,
      decoration: InputDecoration(
          border: UnderlineInputBorder(), labelText: "Presensi Note"),
    );
  }

  widgetBuildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: onCancel,
            child: Text("Cancel"),
            style: ElevatedButton.styleFrom(primary: Colors.redAccent),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: onSaved,
            child: Text("Save"),
            style: ElevatedButton.styleFrom(primary: Colors.green),
          ),
        ),
      ],
    );
  }
}

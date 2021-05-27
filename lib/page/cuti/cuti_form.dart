import 'package:flutter/material.dart';

class CutiForm extends StatelessWidget {
  final String alasan;
  final ValueChanged<String> onChangedAlasan;
  final VoidCallback onSaved;
  final VoidCallback onCancel;

  const CutiForm(
      {Key key, this.alasan, this.onChangedAlasan, this.onSaved, this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [widgetBuildAlasan(), widgetBuildButton()],
      ),
    );
  }

  widgetBuildAlasan() {
    return TextFormField(
      initialValue: alasan,
      validator: (inAlasan) {
        if (inAlasan.isEmpty) {
          return "Alasan harus diisi";
        } else {
          return null;
        }
      },
      onChanged: onChangedAlasan,
      maxLines: 3,
      decoration:
          InputDecoration(border: UnderlineInputBorder(), labelText: "Alasan"),
    );
  }

  widgetBuildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: onCancel,
          child: Text("Cancel"),
          style: ElevatedButton.styleFrom(primary: Colors.redAccent),
        ),
        ElevatedButton(
          onPressed: onSaved,
          child: Text("Save"),
          style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
        ),
      ],
    );
  }
}

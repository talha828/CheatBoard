import 'package:bard_flutter/utilities/utilities.dart';
import 'package:flutter/material.dart';

class AttachmentButton extends StatelessWidget {
  const AttachmentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utilities.pickAndSaveFilePath(),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.attach_file, color: Colors.blue),
      ),
    );
  }
}

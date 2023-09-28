import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void fileUpload({
  required BuildContext context,
  required Function(dynamic) files,
}) async {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Ambil dari galeri'),
            onTap: () async {
              Navigator.of(context).pop();
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                File imagefile = File(result.files.single.path!);
                // File imagefile = result.path; //convert Path to File
                Uint8List imagebytes =
                    await imagefile.readAsBytes(); //convert to bytes
                String base64string =
                    base64.encode(imagebytes); //convert bytes to base64 string
                // print(base64string);

                // List<File> selectedFiles =
                //     result.paths.map((path) => File(path ?? '')).toList();
                files.call(base64string);
              }
            },
          ),
          ListTile(
            title: const Text('Ambil dari kamera'),
            onTap: () async {
              Navigator.of(context).pop();
              // Pick an icon
              final icon =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              if (icon != null) {
                File imagefile = File(icon.path);
                // File imagefile = result.path; //convert Path to File
                Uint8List imagebytes =
                    await imagefile.readAsBytes(); //convert to bytes
                String base64string =
                    base64.encode(imagebytes); //convert bytes to base64 string

                // List<File> selectedFiles =
                //     result.paths.map((path) => File(path ?? '')).toList();
                files.call(base64string);

                // List<File> selectedFiles = [File(icon.path)];
                // files.call(selectedFiles);
              }
            },
          )
        ],
      );
    },
  );
}

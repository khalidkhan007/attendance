import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

ImagePickeR(ImageSource source) async {
  final ImagePicker _imagepicker = ImagePicker();
  XFile? _file=await _imagepicker.pickImage(source:ImageSource.gallery);
if(_file!=null){

return await _file.readAsBytes();
  } else {
    throw Exception('No image selected');
  }
}

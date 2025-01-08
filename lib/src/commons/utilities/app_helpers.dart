import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:news/src/commons/extensions/app_widget_extension.dart';

class AppHelpers {
  AppHelpers._();

  static showAlert({required BuildContext context, required Widget child}) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  static showCountryDialog(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        //return CountryView(isModalOpen: true);
        return Container();
      },
    );
  }

  static String formatNumber(num number) {
    return NumberFormat.decimalPattern().format(number);
  }

  static Future<File?> loadImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? picture = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      maxHeight: 600,
    );
    return (picture != null) ? File(picture.path) : null;
  }

  static Future<File?> loadImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? picture = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      maxHeight: 600,
    );
    return (picture != null) ? File(picture.path) : null;
  }

  static bool isMtn(String value) {
    return (value.startsWith('650') ||
            value.startsWith('651') ||
            value.startsWith('652') ||
            value.startsWith('653') ||
            value.startsWith('654') ||
            value.startsWith('67') ||
            value.startsWith('68'))
        ? true
        : false;
  }




  static String generateInitial({
    required String name,
    String? surname,
  }) {
    return (surname != null)
        ? (name[0].capitalizeFirst + surname[0].capitalizeFirst)
        : name[0].capitalizeFirst;
  }

  static String fullName({
    required String name,
    String? surname,
  }) {
    return (surname != null)
        ? (name + surname).capitalize
        : name.capitalizeFirst;
  }

  static int? getFullNumber(String countryCode, String number) {
    final value = "$countryCode$number".removeAllWhitespace;
    return int.parse(value);
  }

  static String signature([int length = 10]) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final random = Random();
    final value = String.fromCharCodes(Iterable.generate(length, (_) {
      return chars.codeUnitAt(random.nextInt(chars.length));
    }));
    return value;
  }

  static resetAllProviders(WidgetRef ref) {
    //ref.invalidate(senderPurposeProvider);
  }


}

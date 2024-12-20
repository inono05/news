import 'dart:io';
import 'dart:math';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:news/src/commons/extensions/app_context_extension.dart';
import 'package:news/src/commons/extensions/app_widget_extension.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/app_sizes.dart';
import '../widgets/components/app_title.dart';

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

  static void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return debugPrint('permission ==> User granted ');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      return debugPrint('permission ==> User granted provisional permission.');
    } else {
      return debugPrint('permission ==> User declined permission. ');
    }
  }

  static getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('*************************************************');
    debugPrint('DeviceToken ==> $token');
    debugPrint('*************************************************');
  }

 /* static void initializeNotifications() {
    const android = AndroidInitializationSettings('@mipmap/launcher_icon');
    const ios = DarwinInitializationSettings();
    const initializeSettings = InitializationSettings(
      android: android,
      iOS: ios,
    );
    notificationsLocale.initialize(
      initializeSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {},
    );

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        debugPrint("foreground msg ==> ${message.messageId}");
        AndroidNotificationDetails androidNotificationDetails =
            const AndroidNotificationDetails(
          "sopaki",
          "sopaki",
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
        );
        NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails,
          iOS: const DarwinNotificationDetails(),
        );
        await notificationsLocale.show(
          0,
          message.notification?.title,
          message.notification?.body,
          notificationDetails,
          payload: message.data['title'],
        );
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      debugPrint("foreground2 msg ==> ${message.messageId}");
    });
  }*/

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

  static String chosenIdiom({required String idiomTitle}) {
    String idiom = ('en');
    switch (idiomTitle) {
      case 'Français' || 'French' || 'Francés':
        idiom = ('fr');
        break;
      case 'English' || 'Inglés' || 'Anglais':
        idiom = ('en');
        break;
      case 'Spanish' || 'Español' || 'Espagnol':
        idiom = 'es';
        break;
    }
    return idiom;
  }

  static toast(BuildContext context, String message) => Toastification().show(
        context: context,
        title: const AppTitle.h2(
          title: "Success",
          fontWeight: FontWeight.w700,
        ).paddingOnly(top: AppSize.p8),
        description: AppTitle(title: message),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: 2.ms,
        animationDuration: 2.microseconds,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.p10, vertical: AppSize.p8),
      );

  static notify(BuildContext context, String message, {bool isSuccess = true}) {
    isSuccess
        ? CherryToast.success(
            title: Text(message, style: context.headlineLarge),
            borderRadius: AppSize.p10,
            backgroundColor: context.surface,
          ).show(context)
        : CherryToast.warning(
            title: Text(message, style: context.headlineLarge),
            borderRadius: AppSize.p16,
            backgroundColor: context.surface,
          ).show(context);
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

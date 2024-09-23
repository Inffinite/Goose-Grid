import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:intl/intl.dart';

class RiverpodModel extends ChangeNotifier {
  List<SmsMessage> messages = [];
  List powerMessagesByYear = [];
  List powerMessagesByMonth = [];
  int powerSpendingThisMonth = 0;
  int powerSpendingThisYear = 0;
  List<String> months = [];
  List<String> years = [];

  // 0 - month
  // 1 - year
  int totalType = 0;

  RiverpodModel();

  void arrangeMessagesByMonth() {
    months.clear();

    // Find the respective month for each message
    for (int i = 0; i < messages.length; i++) {
      SmsMessage message = messages[i];
      DateTime parsedDateTime = DateTime.parse(message.date.toString());
      final formatter = DateFormat('yM');
      final formattedString = formatter.format(parsedDateTime);

      // Add all those months to a list
      months.add(formattedString);
    }

    // Filter the months list to unique months only
    // This will give us all the months the messages are for neatly
    Set<String> uniqueStrings = months.toSet();
    List<String> uniqueMonths = uniqueStrings.toList();

    List mydata = [];

    // For each unique month create an array
    // That will contain all messages for that specific month
    for (var month in uniqueMonths) {
      mydata.add([]);
    }

    // Distribute the messages according to their month
    for (var i = 0; i < uniqueMonths.length; i++) {
      for (var n = 0; n < messages.length; n++) {
        SmsMessage message = messages[n];
        DateTime parsedDateTime = DateTime.parse(message.date.toString());
        final formatter = DateFormat('yM');
        final formattedString = formatter.format(parsedDateTime);

        if (formattedString == uniqueMonths[i]) {
          // mydata[0].add

          var item = {
            "address": message.address,
            'body': message.body,
            'date': message.date,
          };

          if (message.body!.startsWith("Mtr")) {
            mydata[i].add(item);
          }
        }
      }
    }

    powerMessagesByMonth = mydata;

    DateTime now = DateTime.now();
    final formatter = DateFormat('yM');
    final today = formatter.format(now);
    final storedDate = formatter.format(powerMessagesByMonth[0][0]['date']);

    var totalSpent = 0;

    if (today == storedDate) {
      for (var i = 0; i < powerMessagesByMonth[0].length; i++) {
        var cash = getCashAmount(powerMessagesByMonth[0][i]['body']);
        totalSpent = double.parse(cash.trim()).round() + totalSpent;
      }

      powerSpendingThisMonth = totalSpent;
    }
  }

  void arrangeMessagesByYear() {
    years.clear();

    // Find the respective year for each message
    for (int i = 0; i < messages.length; i++) {
      SmsMessage message = messages[i];
      DateTime parsedDateTime = DateTime.parse(message.date.toString());
      final formatter = DateFormat('y');
      final formattedString = formatter.format(parsedDateTime);

      // Add all those years to a list
      years.add(formattedString);
    }

    // Filter the years list to unique years only
    // This will give us all the years the messages are for neatly
    Set<String> uniqueStrings = years.toSet();
    List<String> uniqueYears = uniqueStrings.toList();

    List mydata = [];

    // For each unique year create an array
    // That will contain all messages for that specific year
    for (var year in uniqueYears) {
      mydata.add([]);
    }

    // Distribute the messages according to their year
    for (var i = 0; i < uniqueYears.length; i++) {
      for (var n = 0; n < messages.length; n++) {
        SmsMessage message = messages[n];
        DateTime parsedDateTime = DateTime.parse(message.date.toString());
        final formatter = DateFormat('y');
        final formattedString = formatter.format(parsedDateTime);

        if (formattedString == uniqueYears[i]) {
          // mydata[0].add

          var item = {
            "address": message.address,
            'body': message.body,
            'date': message.date,
          };

          if (message.body!.startsWith("Mtr")) {
            mydata[i].add(item);
          }
        }
      }
    }

    powerMessagesByYear = mydata;

    DateTime now = DateTime.now();
    final formatter = DateFormat('y');
    final today = formatter.format(now);
    final storedDate = formatter.format(powerMessagesByYear[0][0]['date']);

    var totalSpent = 0;

    if (today == storedDate) {
      for (var i = 0; i < powerMessagesByYear[0].length; i++) {
        var cash = getCashAmount(powerMessagesByYear[0][i]['body']);
        totalSpent = double.parse(cash.trim()).round() + totalSpent;
      }

      powerSpendingThisYear = totalSpent;
    }
  }

  String getCashAmount(String message) {
    int firstNewlineIndex = message.indexOf('\n');
    int secondNewlineIndex = message.indexOf('\n', firstNewlineIndex + 1);
    int thirdNewlineIndex = message.indexOf('\n', secondNewlineIndex + 1);
    int fourthNewlineIndex = message.indexOf('\n', thirdNewlineIndex + 1);
    int fifthNewlineIndex = message.indexOf('\n', fourthNewlineIndex + 1);

    // Extract the fifth line
    String fifthLine =
        message.substring(fourthNewlineIndex + 1, fifthNewlineIndex);

    String newLine = fifthLine.replaceAll("Amt:", "");
    return newLine;
  }

  void changeTotalType() {
    switch (totalType) {
      case 0:
        totalType = 1;
        break;

      case 1:
        totalType = 0;
        break;

      default:
    }

    notifyListeners();
  }

  void changeMessages(List<SmsMessage> chats) {
    messages = chats;
    notifyListeners();
  }
}

// arrangeMessagesByDay() {
//   setState(() {
//     dates.clear();
//   });

//   List<SmsMessage> messages = powerMessages;

//   for (int i = 0; i < messages.length; i++) {
//     SmsMessage message = messages[i];
//     DateTime parsedDateTime = DateTime.parse(message.date.toString());
//     final formatter = DateFormat('yMd');
//     final formattedString = formatter.format(parsedDateTime);

//     setState(() {
//       dates.add(formattedString);
//     });
//   }

//   log('${dates.length}');

//   Set<String> uniqueStrings = dates.toSet();
//   List<String> uniqueDates = uniqueStrings.toList();

//   print(uniqueDates);

//   List mydata = [];

//   for (var date in uniqueDates) {
//     mydata.add([]);
//   }

//   for (var i = 0; i < uniqueDates.length; i++) {
//     for (var n = 0; n < messages.length; n++) {
//       SmsMessage message = messages[n];
//       DateTime parsedDateTime = DateTime.parse(message.date.toString());
//       final formatter = DateFormat('yMd');
//       final formattedString = formatter.format(parsedDateTime);

//       if (formattedString == uniqueDates[i]) {
//         // mydata[0].add

//         var item = {
//           "address": message.address,
//           'body': message.body,
//           'date': message.date,
//         };

//         mydata[i].add(item);
//       }
//     }
//   }

//   // print(mydata[1][0]);
//   print(mydata[0]);
// }

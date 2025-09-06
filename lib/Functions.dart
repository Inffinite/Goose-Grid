import 'package:intl/intl.dart';

getMeterNumber(String message) {
  String firstLine = message.substring(0, message.indexOf('\n'));
  String newLine = firstLine.replaceAll("Mtr:", "");
  return newLine;
}

getToken(String message) {
  int firstNewlineIndex = message.indexOf('\n');
  int secondNewlineIndex = message.indexOf('\n', firstNewlineIndex + 1);

  String secondLine =
      message.substring(firstNewlineIndex + 1, secondNewlineIndex);
  String newLine = secondLine.replaceAll("Token:", "");
  return newLine;
}

getDate(String message) {
  int firstNewlineIndex = message.indexOf('\n');
  int secondNewlineIndex = message.indexOf('\n', firstNewlineIndex + 1);
  int thirdNewlineIndex = message.indexOf('\n', secondNewlineIndex + 1);

  // Extract the third line
  String thirdLine =
      message.substring(secondNewlineIndex + 1, thirdNewlineIndex);

  String newLine = thirdLine.replaceAll("Date:", "");
  return newLine;
}

getUnits(String message) {
  int firstNewlineIndex = message.indexOf('\n');
  int secondNewlineIndex = message.indexOf('\n', firstNewlineIndex + 1);
  int thirdNewlineIndex = message.indexOf('\n', secondNewlineIndex + 1);
  int fourthNewlineIndex = message.indexOf('\n', thirdNewlineIndex + 1);

  // Extract the fourth line
  String fourthLine =
      message.substring(thirdNewlineIndex + 1, fourthNewlineIndex);

  String newLine = fourthLine.replaceAll("Units:", "");
  return newLine;
}

getCashAmount(String message) {
  int firstNewlineIndex = message.indexOf('\n');
  int secondNewlineIndex = message.indexOf('\n', firstNewlineIndex + 1);
  int thirdNewlineIndex = message.indexOf('\n', secondNewlineIndex + 1);
  int fourthNewlineIndex = message.indexOf('\n', thirdNewlineIndex + 1);
  int fifthNewlineIndex = message.indexOf('\n', fourthNewlineIndex + 1);

  // Extract the fifth line
  String fifthLine =
      message.substring(fourthNewlineIndex + 1, fifthNewlineIndex);

  String newLine = fifthLine.replaceAll("Amt:", "");

  var num = double.parse(newLine);

  String formattedNumber = num.toStringAsFixed(0);

  return formattedNumber.toString();
}

getTokenAmount(String message) {
  int firstNewlineIndex = message.indexOf('\n');
  int secondNewlineIndex = message.indexOf('\n', firstNewlineIndex + 1);
  int thirdNewlineIndex = message.indexOf('\n', secondNewlineIndex + 1);
  int fourthNewlineIndex = message.indexOf('\n', thirdNewlineIndex + 1);
  int fifthNewlineIndex = message.indexOf('\n', fourthNewlineIndex + 1);
  int sixthNewlineIndex = message.indexOf('\n', fifthNewlineIndex + 1);

  // Extract the sixth line
  String sixthLine =
      message.substring(fifthNewlineIndex + 1, sixthNewlineIndex);

  String newLine = sixthLine.replaceAll("TknAmt:", "");
  return newLine;
}

formatCashAmount(int cash) {
  NumberFormat formatter = NumberFormat.decimalPattern();
  String formattedNumber = formatter.format(cash);

  return formattedNumber;
}

formatDate(String timestamp) {
  try {
    DateTime parsedDateTime = DateTime.parse(timestamp);
    final formatter = DateFormat('EEEE dd, h:mma');
    final formattedString = formatter.format(parsedDateTime);
    return formattedString;
  } catch (e) {
    return '00';
  }
}

// calculateYearlySpending(List data) {

// }

calculateTotalSpendings(List data) {
  var totalSpent = 0;

  for (var i = 0; i < data.length; i++) {
    int amount = int.parse(getCashAmount(data[i]['body']));
    totalSpent = totalSpent + amount;
  }

  NumberFormat formatter = NumberFormat.decimalPattern();
  String formattedNumber = formatter.format(totalSpent);

  return formattedNumber;
}

calculateTotalUnits(List data) {
  double totalUnits = 0.0;

  for (var i = 0; i < data.length; i++) {
    double amount = double.parse(getUnits(data[i]['body']));

    totalUnits = totalUnits + amount;
  }

  String myNumber = totalUnits.toStringAsFixed(2);

  NumberFormat formatter = NumberFormat.decimalPattern();
  String formattedNumber = formatter.format(double.parse(myNumber));

  return formattedNumber;
}

calculateMonth(List data) {
  var date;

  for (var i = 0; i < 1; i++) {
    date = data[i]['date'];
  }

  DateTime parsedDateTime = DateTime.parse(date.toString());
  final formatter = DateFormat('MMMM, y');
  final formattedString = formatter.format(parsedDateTime);
  return formattedString.toUpperCase();
}

getOtherCharges(String message) {
  int firstNewlineIndex = message.indexOf('\n');
  int secondNewlineIndex = message.indexOf('\n', firstNewlineIndex + 1);
  int thirdNewlineIndex = message.indexOf('\n', secondNewlineIndex + 1);
  int fourthNewlineIndex = message.indexOf('\n', thirdNewlineIndex + 1);
  int fifthNewlineIndex = message.indexOf('\n', fourthNewlineIndex + 1);
  int sixthNewlineIndex = message.indexOf('\n', fifthNewlineIndex + 1);
  int seventhNewlineIndex = message.indexOf('\n', sixthNewlineIndex + 1);

  // Extract the seventh line
  String seventhLine =
      message.substring(sixthNewlineIndex + 1, seventhNewlineIndex);

  String newLine = seventhLine.replaceAll("OtherCharges:", "");
  return newLine;
}

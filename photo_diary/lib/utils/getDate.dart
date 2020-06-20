class GetDate {
  var today = DateTime.now();

  String getCurrentDate() {
    String date = today.day.toString() +
        "-" +
        today.month.toString() +
        "-" +
        today.year.toString();
    return date;
  }
}

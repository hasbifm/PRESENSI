enum status { WEEK_DAY, WEEK_END, HOLIDAY }

class Calendar {
  int id;
  DateTime date;
  int day;
  int month;
  String month_name;
  int year;
  Set status;
  String description;
}

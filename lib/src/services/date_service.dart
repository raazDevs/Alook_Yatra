class DateService {
  getTodayDate() {
    DateTime todayDate = DateTime.now();
    return todayDate;
  }

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) return "Good Morning";
    if (hour < 18) return "Good Afternoon";
    return "Good Evening";
  }
}

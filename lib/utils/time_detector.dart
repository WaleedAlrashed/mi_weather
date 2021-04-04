class TimeDetector {
  static bool isNight() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return false;
    }

    return true;
  }
}

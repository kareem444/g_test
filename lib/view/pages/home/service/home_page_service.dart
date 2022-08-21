class HomePageService {
  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    if (hour < 20) {
      return 'Evening';
    }
    return 'Night';
  }
}

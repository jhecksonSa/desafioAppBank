const pathImageAssets = 'assets/images';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

extension ConctatBefore on String {
  String concatBefore(String value) {
    return '$value$this';
  }
}

extension Captalization on String {
  String captalization() {
    List<String> str = split(' ');

    return str.map((value) => value[0].toUpperCase() + value.substring(1)).join(' ');
  }
}

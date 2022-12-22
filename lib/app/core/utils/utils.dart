class StringUtils {
  String upperFirstCharacter({required String value}) {
    return "${value[0].toUpperCase()}${value.substring(1)}";
  }
}

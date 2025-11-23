import 'package:uuid/uuid.dart';

String generateCustomId() {
  var uuid = const Uuid();
  return uuid.v4();
}
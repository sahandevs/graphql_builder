import 'package:graphql_builder/src/Base.dart';

class Name extends Base {
  static RegExp _nameValidator = new RegExp(r"[_A-Za-z][_0-9A-Za-z]*");

  static bool validate(String name) => _nameValidator.hasMatch(name);

  final String value;

  Name(this.value) : assert(validate(value));

  @override
  String bake() {
    return value;
  }
}

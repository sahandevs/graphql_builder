import 'package:graphql_builder/src/Base.dart';

class Name extends Base {

  static RegExp _nameValidator = new RegExp(r"[_A-Za-z][_0-9A-Za-z]*");

  final String value;

  Name(this.value) : assert(Name._nameValidator.hasMatch(value));

}
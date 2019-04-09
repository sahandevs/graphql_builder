import 'package:graphql_builder/src/Value/ConstValue/ConstValue.dart';

class NullConst extends Const {
  @override
  String bake() {
    return "null";
  }
}

abstract class ValueConst<T> extends Const {
  T value;

  ValueConst(this.value);
}

class BooleanConst extends ValueConst<bool> {
  BooleanConst(bool value) : super(value);

  @override
  String bake() {
    return value ? "true" : "false";
  }
}

class NumberConst extends ValueConst<num> {
  NumberConst(num value) : super(value);

  @override
  String bake() {
    return value == 0 ? "0" : value.toString();
  }
}

class StringConst extends ValueConst<String> {
  StringConst(String value) : super(value);

  @override
  String bake() {
    return "\"$value\"";
  }
}

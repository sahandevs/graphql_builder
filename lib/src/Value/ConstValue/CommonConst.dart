import 'package:graphql_builder/src/Value/ConstValue/ConstValue.dart';

class NullConst extends Const {}

class ValueConst<T> extends Const {
  T value;

  ValueConst(this.value);
}

class BooleanConst extends ValueConst<bool> {
  BooleanConst(bool value) : super(value);
}

class NumberConst extends ValueConst<num> {
  NumberConst(num value) : super(value);
}

class StringConst extends ValueConst<String> {
  StringConst(String value) : super(value);
}

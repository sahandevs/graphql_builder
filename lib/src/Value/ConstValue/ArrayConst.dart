import 'package:graphql_builder/src/Value/ConstValue/ConstValue.dart';
import 'package:graphql_builder/src/Value/Value.dart';

class ArrayConst extends Const {

  List<Value> values;

  ArrayConst(this.values);

}
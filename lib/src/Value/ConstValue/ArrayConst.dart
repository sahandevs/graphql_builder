import 'package:graphql_builder/src/Value/ConstValue/ConstValue.dart';
import 'package:graphql_builder/src/Value/Value.dart';

class ArrayConst extends Const {

  List<Value> values;

  ArrayConst(this.values);

  @override
  String bake() {
    var _values = (values ?? []).map((item) => item.bake()).join(",");
    return "[$_values]";
  }

}
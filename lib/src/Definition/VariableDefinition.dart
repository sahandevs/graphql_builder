import 'package:graphql_builder/src/Base.dart';
import 'package:graphql_builder/src/Value/ConstValue/ConstValue.dart';
import 'package:graphql_builder/src/Value/Variable.dart';
import 'package:graphql_builder/src/VariableType.dart';

class VariableDefinition extends Base {
  VariableType type;
  Variable variable;
  Const defaultValue;

  VariableDefinition(String name, this.type, {this.defaultValue})
      : this.variable = Variable(name);

  @override
  String bake() {
    var _defaultValue = defaultValue == null ? "" : "=${defaultValue.bake()}";
    return "${variable.bake()}:${type.bake()}$_defaultValue";
  }
}

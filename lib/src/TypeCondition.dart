import 'package:graphql_builder/src/Base.dart';
import 'package:graphql_builder/src/Name.dart';

class TypeCondition extends Base {
  Name typeName;

  TypeCondition(String name) {
    this.typeName = Name(name);
  }

  @override
  String bake() {
    return "on ${typeName.bake()}";
  }
}

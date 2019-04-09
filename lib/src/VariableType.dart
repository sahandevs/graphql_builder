import 'package:graphql_builder/src/Base.dart';
import 'package:graphql_builder/src/Name.dart';

class VariableType extends Base {
  bool nullable;
  final Name name;

  VariableType(String name, {this.nullable = true}) : this.name = Name(name);

  @override
  String bake() {
    return "${name.bake()}${nullable ? "" : "!"}";
  }
}

class ListType extends VariableType {

  bool nullableList;

  ListType(String name, {bool nullable = true, this.nullableList = true}) : super(name, nullable: nullable);

  @override
  String bake() {
    return "[${super.bake()}]${nullableList ? "" : "!"}";
  }

}

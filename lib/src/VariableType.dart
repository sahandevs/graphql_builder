import 'package:graphql_builder/src/Base.dart';
import 'package:graphql_builder/src/Name.dart';

class VariableType extends Base {
  bool nullable;
  final Name name;

  VariableType(String name, {this.nullable = false}) : this.name = Name(name);
}

class ListType extends VariableType {
  ListType(String name, {bool nullable}) : super(name, nullable: nullable);
}

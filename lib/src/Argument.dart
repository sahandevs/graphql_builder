import 'package:graphql_builder/src/Base.dart';
import 'package:graphql_builder/src/Name.dart';
import 'package:graphql_builder/src/Value/Value.dart';

class Argument extends Base {

  final Name name;
  Value value;

  Argument(String name, this.value): this.name = Name(name);

  @override
  String bake() {
    return "${name.bake()}:${value.bake()}";
  }

}
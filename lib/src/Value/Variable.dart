import 'package:graphql_builder/src/Name.dart';
import 'package:graphql_builder/src/Value/Value.dart';

class Variable extends Value {
  Name name;

  Variable(String name)
      : this.name = Name(name),
        super();

  @override
  String bake() {
    return "\$${name.bake()}";
  }
}

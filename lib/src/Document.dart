import 'package:graphql_builder/src/Base.dart';
import 'package:graphql_builder/src/Definition/Definition.dart';

class Document extends Base {
  List<Definition> definitions = [];

  Document add(Definition definition) {
    definitions.add(definition);
    return this;
  }

  @override
  String bake() {
    return definitions.map((item) => item.bake()).join(" ");
  }
}

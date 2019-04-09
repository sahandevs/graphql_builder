import 'package:graphql_builder/src/Definition/Definition.dart';
import 'package:graphql_builder/src/Directive/Directive.dart';
import 'package:graphql_builder/src/Name.dart';
import 'package:graphql_builder/src/Selection/Selection.dart';
import 'package:graphql_builder/src/TypeCondition.dart';

class Fragment extends Definition {
  TypeCondition typeCondition;
  List<Directive> directives;
  List<Selection> selections;

  Fragment(String name, this.typeCondition) {
    this.name = Name(name);
  }

  Fragment addDirective(Directive directive) {
    if (directives == null) directives = [];
    directives.add(directive);
    return this;
  }

  Fragment addSelection(Selection selection) {
    if (selections == null) selections = [];
    selections.add(selection);
    return this;
  }

  @override
  String bake() {
    assert(name != null && name.value != null);
    assert(typeCondition != null);

    var _directives = (directives ?? []).map((item) => item.bake()).join(" ");
    _directives = _directives.isNotEmpty ? " $_directives" : "";

    assert(selections != null && selections.isNotEmpty);

    var _selections = selections.map((item) => item.bake()).join(" ");

    return "fragment ${name.bake()} ${typeCondition.bake()}$_directives {$_selections}";
  }
}

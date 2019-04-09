import 'package:graphql_builder/src/Definition/Definition.dart';
import 'package:graphql_builder/src/Directive/Directive.dart';
import 'package:graphql_builder/src/Selection/Selection.dart';
import 'package:graphql_builder/src/TypeCondition.dart';

class Fragment extends Definition {
  TypeCondition typeCondition;
  List<Directive> directives;
  List<Selection> selections;

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
}

import 'package:graphql_builder/src/Directive/Directive.dart';
import 'package:graphql_builder/src/Selection/Selection.dart';
import 'package:graphql_builder/src/TypeCondition.dart';

class InlineFragment extends Selection {
  TypeCondition typeCondition;
  List<Directive> directives;
  List<Selection> selections;

  InlineFragment({this.typeCondition});

  InlineFragment addDirective(Directive directive) {
    if (directives == null) directives = [];
    directives.add(directive);
    return this;
  }

  InlineFragment addSelection(Selection selection) {
    if (selections == null) selections = [];
    selections.add(selection);
    return this;
  }
}

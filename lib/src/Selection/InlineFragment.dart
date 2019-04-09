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

  @override
  String bake() {
    var _typeCondition = typeCondition == null ? "" : " ${typeCondition.bake()}";

    var _directives = (directives ?? []).map((item) => item.bake()).join(" ");
    _directives = _directives.isNotEmpty ? " $directives" : "";

    assert(selections != null && selections.isNotEmpty);
    var _selections = selections.map((item) => item.bake()).join(" ");

    return "...$_typeCondition$_directives {$_selections}";
  }

}

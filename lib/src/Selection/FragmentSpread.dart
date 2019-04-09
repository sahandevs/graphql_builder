import 'package:graphql_builder/src/Directive/Directive.dart';
import 'package:graphql_builder/src/Name.dart';
import 'package:graphql_builder/src/Selection/Selection.dart';

class FragmentSpread extends Selection {
  final Name name;
  List<Directive> directives;

  FragmentSpread(String name) : this.name = Name(name);

  FragmentSpread addDirective(Directive directive) {
    if (directives == null) directives = [];
    directives.add(directive);
    return this;
  }
  
}

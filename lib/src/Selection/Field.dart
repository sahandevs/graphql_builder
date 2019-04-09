import 'package:graphql_builder/src/Argument.dart';
import 'package:graphql_builder/src/Directive/Directive.dart';
import 'package:graphql_builder/src/Name.dart';
import 'package:graphql_builder/src/Selection/Selection.dart';

class Field extends Selection {

  Name alias;
  final Name name;
  List<Argument> arguments;
  List<Directive> directives;
  List<Selection> selections;

  Field(String name, {this.alias}) : this.name = Name(name);

  Field addArgument(Argument arg) {
    if (arguments == null) arguments = [];
    arguments.add(arg);
    return this;
  }

  Field addDirective(Directive directive) {
    if (directives == null) directives = [];
    directives.add(directive);
    return this;
  }

  Field addSelection(Selection selection) {
    if (selections == null) selections = [];
    selections.add(selection);
    return this;
  }

}

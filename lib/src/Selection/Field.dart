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

  @override
  String bake() {
    var _alias = alias != null && alias.value.isNotEmpty ? "${alias.bake()}:" : "";

    var _arguments = (arguments ?? []).map((item) => item.bake()).join(",");
    _arguments = _arguments.isEmpty ? "" : "($_arguments)";
    
    var _directives = (directives ?? []).map((item) => item.bake()).join(" ");
    _directives = _directives.isNotEmpty ? " $_directives" : "";

    var _selections = (selections ?? []).map((item) => item.bake()).join(" ");
    _selections = _selections.isEmpty ? "" : " {${_selections}}";

    return "$_alias${name.bake()}$_arguments$_directives$_selections";
  }
}

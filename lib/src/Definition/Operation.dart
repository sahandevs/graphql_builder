import 'package:graphql_builder/graphql_builder.dart';
import 'package:graphql_builder/src/Definition/Definition.dart';
import 'package:graphql_builder/src/Definition/VariableDefinition.dart';
import 'package:graphql_builder/src/Directive/Directive.dart';
import 'package:graphql_builder/src/Selection/Selection.dart';

abstract class Operation extends Definition {
  OperationType get type;

  List<Directive> directives;
  List<Selection> selections;
  List<VariableDefinition> variables;

  Operation({this.variables, String name}) {
    this.name = (name != null && name.isNotEmpty) ? Name(name) : null;
  }

  Operation addDirective(Directive directive) {
    if (directives == null) directives = [];
    directives.add(directive);
    return this;
  }

  Operation addSelection(Selection selection) {
    if (selections == null) selections = [];
    selections.add(selection);
    return this;
  }

  Operation addVariable(VariableDefinition variable) {
    if (variables == null) variables = [];
    variables.add(variable);
    return this;
  }

  String get typeName {
    assert(type != null);
    switch (type) {
      case OperationType.Query:
        return "query";
      case OperationType.Mutation:
        return "mutation";
      case OperationType.Subscription:
        return "subscription";
    }
    return "";
  }

  @override
  String bake() {
    var _name = name != null && name.value.isNotEmpty ? " ${name.bake()}" : "";

    var _directives = (directives ?? []).map((item) => item.bake()).join(" ");
    _directives = _directives != "" ? " $_directives" : "";

    assert(selections != null && selections.isNotEmpty);
    var _selections = selections.map((item) => item.bake()).join(" ");

    var _variables = (variables ?? []).map((item) => item.bake()).join(",");
    _variables = _variables.isEmpty ? "" : "($_variables)";

    return "$typeName$_name$_variables$_directives {$_selections}";
  }
}

class Query extends Operation {
  Query({List<VariableDefinition> variables, String name})
      : super(variables: variables, name: name);

  @override
  OperationType get type => OperationType.Query;
}

class Mutation extends Operation {
  Mutation({List<VariableDefinition> variables, String name})
      : super(variables: variables, name: name);

  @override
  OperationType get type => OperationType.Mutation;
}

class Subscription extends Operation {
  Subscription({List<VariableDefinition> variables, String name})
      : super(variables: variables, name: name);

  @override
  OperationType get type => OperationType.Subscription;
}

enum OperationType {
  Query,
  Mutation,
  Subscription,
}

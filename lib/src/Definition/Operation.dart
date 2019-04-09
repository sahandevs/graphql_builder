import 'package:graphql_builder/src/Definition/Definition.dart';
import 'package:graphql_builder/src/Definition/VariableDefinition.dart';
import 'package:graphql_builder/src/Directive/Directive.dart';
import 'package:graphql_builder/src/Selection/Selection.dart';

abstract class Operation extends Definition {
  OperationType get type;

  List<Directive> directives;
  List<Selection> selections;
  List<VariableDefinition> variables;

  Operation({this.variables});

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
}

class Query extends Operation {
  @override
  OperationType get type => OperationType.Query;
}

class Mutation extends Operation {
  @override
  OperationType get type => OperationType.Mutation;
}

class Subscription extends Operation {
  @override
  OperationType get type => OperationType.Subscription;
}

enum OperationType {
  Query,
  Mutation,
  Subscription,
}

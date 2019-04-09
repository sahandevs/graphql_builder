import 'package:graphql_builder/src/Argument.dart';
import 'package:graphql_builder/src/Directive/Directive.dart';
import 'package:graphql_builder/src/Name.dart';
import 'package:graphql_builder/src/Value/Value.dart';

class IncludeDirective extends Directive {

  @override
  Name get name => Name("include");

  IncludeDirective(Value condition) {
    this.argument = Argument("if", condition);
  }

}
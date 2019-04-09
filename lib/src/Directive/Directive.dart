import 'package:graphql_builder/src/Argument.dart';
import 'package:graphql_builder/src/Base.dart';
import 'package:graphql_builder/src/Name.dart';

abstract class Directive extends Base {

  Name get name;
  Argument argument;

}
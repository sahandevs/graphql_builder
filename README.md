[![Actions Status](https://github.com/SahandAkbarzadeh/graphql_builder/workflows/Dart%20CI/badge.svg)](https://github.com/SahandAkbarzadeh/graphql_builder/actions)

Build GraphQL queries in dart.

## Example
this code:
```dart
Document()
    .add(Query(name: "test")
        .addSelection(Field("title"))
        .addSelection(Field("name"))
        .addSelection(FragmentSpread("frag1")))
    .add(Fragment("frag1", TypeCondition("Cat"))
        .addSelection(Field("id"))
        .addSelection(Field("name")))
    .bake()
```
will generate this query:
```
query test {
  title
  name
  ...frag1
} 

fragment frag1 on Cat {
  id
  name
}
```

## Usage

add `graphql_builder: ^1.0.0` to your dependencies

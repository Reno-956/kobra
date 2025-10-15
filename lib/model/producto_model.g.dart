// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductoModelCollection on Isar {
  IsarCollection<ProductoModel> get productoModels => this.collection();
}

const ProductoModelSchema = CollectionSchema(
  name: r'ProductoModel',
  id: -8283790178398363742,
  properties: {
    r'cantidad': PropertySchema(
      id: 0,
      name: r'cantidad',
      type: IsarType.long,
    ),
    r'cantidadProducto': PropertySchema(
      id: 1,
      name: r'cantidadProducto',
      type: IsarType.long,
    ),
    r'codigoPrincipal': PropertySchema(
      id: 2,
      name: r'codigoPrincipal',
      type: IsarType.string,
    ),
    r'descripcion': PropertySchema(
      id: 3,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'esSincronizado': PropertySchema(
      id: 4,
      name: r'esSincronizado',
      type: IsarType.bool,
    ),
    r'fechaCreacion': PropertySchema(
      id: 5,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'medida': PropertySchema(
      id: 6,
      name: r'medida',
      type: IsarType.string,
    ),
    r'precioUnitario': PropertySchema(
      id: 7,
      name: r'precioUnitario',
      type: IsarType.double,
    )
  },
  estimateSize: _productoModelEstimateSize,
  serialize: _productoModelSerialize,
  deserialize: _productoModelDeserialize,
  deserializeProp: _productoModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _productoModelGetId,
  getLinks: _productoModelGetLinks,
  attach: _productoModelAttach,
  version: '3.1.0+1',
);

int _productoModelEstimateSize(
  ProductoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.codigoPrincipal.length * 3;
  bytesCount += 3 + object.descripcion.length * 3;
  {
    final value = object.medida;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productoModelSerialize(
  ProductoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cantidad);
  writer.writeLong(offsets[1], object.cantidadProducto);
  writer.writeString(offsets[2], object.codigoPrincipal);
  writer.writeString(offsets[3], object.descripcion);
  writer.writeBool(offsets[4], object.esSincronizado);
  writer.writeDateTime(offsets[5], object.fechaCreacion);
  writer.writeString(offsets[6], object.medida);
  writer.writeDouble(offsets[7], object.precioUnitario);
}

ProductoModel _productoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductoModel(
    cantidad: reader.readLong(offsets[0]),
    cantidadProducto: reader.readLong(offsets[1]),
    codigoPrincipal: reader.readString(offsets[2]),
    descripcion: reader.readString(offsets[3]),
    esSincronizado: reader.readBoolOrNull(offsets[4]) ?? true,
    fechaCreacion: reader.readDateTimeOrNull(offsets[5]),
    id: id,
    medida: reader.readStringOrNull(offsets[6]),
    precioUnitario: reader.readDouble(offsets[7]),
  );
  return object;
}

P _productoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productoModelGetId(ProductoModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _productoModelGetLinks(ProductoModel object) {
  return [];
}

void _productoModelAttach(
    IsarCollection<dynamic> col, Id id, ProductoModel object) {
  object.id = id;
}

extension ProductoModelQueryWhereSort
    on QueryBuilder<ProductoModel, ProductoModel, QWhere> {
  QueryBuilder<ProductoModel, ProductoModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductoModelQueryWhere
    on QueryBuilder<ProductoModel, ProductoModel, QWhereClause> {
  QueryBuilder<ProductoModel, ProductoModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductoModelQueryFilter
    on QueryBuilder<ProductoModel, ProductoModel, QFilterCondition> {
  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      cantidadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      cantidadGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      cantidadLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      cantidadBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      cantidadProductoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidadProducto',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      cantidadProductoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidadProducto',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      cantidadProductoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidadProducto',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      cantidadProductoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidadProducto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codigoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codigoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codigoPrincipal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codigoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codigoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codigoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codigoPrincipal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoPrincipal',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      codigoPrincipalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codigoPrincipal',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      esSincronizadoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esSincronizado',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      fechaCreacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaCreacion',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      fechaCreacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaCreacion',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      fechaCreacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      fechaCreacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      fechaCreacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'medida',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'medida',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medida',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medida',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medida',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      medidaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medida',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      precioUnitarioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      precioUnitarioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      precioUnitarioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterFilterCondition>
      precioUnitarioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioUnitario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ProductoModelQueryObject
    on QueryBuilder<ProductoModel, ProductoModel, QFilterCondition> {}

extension ProductoModelQueryLinks
    on QueryBuilder<ProductoModel, ProductoModel, QFilterCondition> {}

extension ProductoModelQuerySortBy
    on QueryBuilder<ProductoModel, ProductoModel, QSortBy> {
  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> sortByCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByCantidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByCantidadProducto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadProducto', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByCantidadProductoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadProducto', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByCodigoPrincipal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoPrincipal', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByCodigoPrincipalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoPrincipal', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByEsSincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> sortByMedida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medida', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> sortByMedidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medida', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByPrecioUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      sortByPrecioUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.desc);
    });
  }
}

extension ProductoModelQuerySortThenBy
    on QueryBuilder<ProductoModel, ProductoModel, QSortThenBy> {
  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> thenByCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByCantidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByCantidadProducto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadProducto', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByCantidadProductoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadProducto', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByCodigoPrincipal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoPrincipal', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByCodigoPrincipalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoPrincipal', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByEsSincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> thenByMedida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medida', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy> thenByMedidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medida', Sort.desc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByPrecioUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.asc);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QAfterSortBy>
      thenByPrecioUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioUnitario', Sort.desc);
    });
  }
}

extension ProductoModelQueryWhereDistinct
    on QueryBuilder<ProductoModel, ProductoModel, QDistinct> {
  QueryBuilder<ProductoModel, ProductoModel, QDistinct> distinctByCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidad');
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QDistinct>
      distinctByCantidadProducto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidadProducto');
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QDistinct>
      distinctByCodigoPrincipal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codigoPrincipal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QDistinct>
      distinctByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esSincronizado');
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QDistinct> distinctByMedida(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medida', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductoModel, ProductoModel, QDistinct>
      distinctByPrecioUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioUnitario');
    });
  }
}

extension ProductoModelQueryProperty
    on QueryBuilder<ProductoModel, ProductoModel, QQueryProperty> {
  QueryBuilder<ProductoModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductoModel, int, QQueryOperations> cantidadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidad');
    });
  }

  QueryBuilder<ProductoModel, int, QQueryOperations>
      cantidadProductoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidadProducto');
    });
  }

  QueryBuilder<ProductoModel, String, QQueryOperations>
      codigoPrincipalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codigoPrincipal');
    });
  }

  QueryBuilder<ProductoModel, String, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<ProductoModel, bool, QQueryOperations> esSincronizadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esSincronizado');
    });
  }

  QueryBuilder<ProductoModel, DateTime?, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ProductoModel, String?, QQueryOperations> medidaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medida');
    });
  }

  QueryBuilder<ProductoModel, double, QQueryOperations>
      precioUnitarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioUnitario');
    });
  }
}

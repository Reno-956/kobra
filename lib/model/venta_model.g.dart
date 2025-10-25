// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venta_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVentaModelCollection on Isar {
  IsarCollection<VentaModel> get ventaModels => this.collection();
}

const VentaModelSchema = CollectionSchema(
  name: r'VentaModel',
  id: -5279231218934115143,
  properties: {
    r'cliente': PropertySchema(
      id: 0,
      name: r'cliente',
      type: IsarType.long,
    ),
    r'descuento': PropertySchema(
      id: 1,
      name: r'descuento',
      type: IsarType.double,
    ),
    r'esSincronizado': PropertySchema(
      id: 2,
      name: r'esSincronizado',
      type: IsarType.bool,
    ),
    r'fechaCreacion': PropertySchema(
      id: 3,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'informacion': PropertySchema(
      id: 4,
      name: r'informacion',
      type: IsarType.string,
    ),
    r'items': PropertySchema(
      id: 5,
      name: r'items',
      type: IsarType.objectList,
      target: r'ProductItemModel',
    ),
    r'precioTotal': PropertySchema(
      id: 6,
      name: r'precioTotal',
      type: IsarType.double,
    ),
    r'productoTotal': PropertySchema(
      id: 7,
      name: r'productoTotal',
      type: IsarType.long,
    ),
    r'usuario': PropertySchema(
      id: 8,
      name: r'usuario',
      type: IsarType.long,
    )
  },
  estimateSize: _ventaModelEstimateSize,
  serialize: _ventaModelSerialize,
  deserialize: _ventaModelDeserialize,
  deserializeProp: _ventaModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ProductItemModel': ProductItemModelSchema},
  getId: _ventaModelGetId,
  getLinks: _ventaModelGetLinks,
  attach: _ventaModelAttach,
  version: '3.1.0+1',
);

int _ventaModelEstimateSize(
  VentaModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.informacion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[ProductItemModel]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount +=
          ProductItemModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _ventaModelSerialize(
  VentaModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cliente);
  writer.writeDouble(offsets[1], object.descuento);
  writer.writeBool(offsets[2], object.esSincronizado);
  writer.writeDateTime(offsets[3], object.fechaCreacion);
  writer.writeString(offsets[4], object.informacion);
  writer.writeObjectList<ProductItemModel>(
    offsets[5],
    allOffsets,
    ProductItemModelSchema.serialize,
    object.items,
  );
  writer.writeDouble(offsets[6], object.precioTotal);
  writer.writeLong(offsets[7], object.productoTotal);
  writer.writeLong(offsets[8], object.usuario);
}

VentaModel _ventaModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VentaModel(
    cliente: reader.readLongOrNull(offsets[0]),
    descuento: reader.readDouble(offsets[1]),
    esSincronizado: reader.readBoolOrNull(offsets[2]),
    fechaCreacion: reader.readDateTime(offsets[3]),
    id: id,
    informacion: reader.readStringOrNull(offsets[4]),
    items: reader.readObjectList<ProductItemModel>(
          offsets[5],
          ProductItemModelSchema.deserialize,
          allOffsets,
          ProductItemModel(),
        ) ??
        [],
    precioTotal: reader.readDouble(offsets[6]),
    productoTotal: reader.readLong(offsets[7]),
    usuario: reader.readLong(offsets[8]),
  );
  return object;
}

P _ventaModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<ProductItemModel>(
            offset,
            ProductItemModelSchema.deserialize,
            allOffsets,
            ProductItemModel(),
          ) ??
          []) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ventaModelGetId(VentaModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _ventaModelGetLinks(VentaModel object) {
  return [];
}

void _ventaModelAttach(IsarCollection<dynamic> col, Id id, VentaModel object) {
  object.id = id;
}

extension VentaModelQueryWhereSort
    on QueryBuilder<VentaModel, VentaModel, QWhere> {
  QueryBuilder<VentaModel, VentaModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VentaModelQueryWhere
    on QueryBuilder<VentaModel, VentaModel, QWhereClause> {
  QueryBuilder<VentaModel, VentaModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<VentaModel, VentaModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterWhereClause> idBetween(
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

extension VentaModelQueryFilter
    on QueryBuilder<VentaModel, VentaModel, QFilterCondition> {
  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> clienteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cliente',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      clienteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cliente',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> clienteEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cliente',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      clienteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cliente',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> clienteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cliente',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> clienteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cliente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> descuentoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descuento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      descuentoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descuento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> descuentoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descuento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> descuentoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descuento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      esSincronizadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'esSincronizado',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      esSincronizadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'esSincronizado',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      esSincronizadoEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esSincronizado',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      fechaCreacionGreaterThan(
    DateTime value, {
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

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      fechaCreacionLessThan(
    DateTime value, {
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

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      fechaCreacionBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'informacion',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'informacion',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'informacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'informacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'informacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'informacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'informacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'informacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'informacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'informacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'informacion',
        value: '',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      informacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'informacion',
        value: '',
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      precioTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      precioTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      precioTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      precioTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      productoTotalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productoTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      productoTotalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productoTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      productoTotalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productoTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      productoTotalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productoTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> usuarioEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition>
      usuarioGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> usuarioLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> usuarioBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VentaModelQueryObject
    on QueryBuilder<VentaModel, VentaModel, QFilterCondition> {
  QueryBuilder<VentaModel, VentaModel, QAfterFilterCondition> itemsElement(
      FilterQuery<ProductItemModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension VentaModelQueryLinks
    on QueryBuilder<VentaModel, VentaModel, QFilterCondition> {}

extension VentaModelQuerySortBy
    on QueryBuilder<VentaModel, VentaModel, QSortBy> {
  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cliente', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cliente', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy>
      sortByEsSincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByInformacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informacion', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByInformacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informacion', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByPrecioTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioTotal', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByPrecioTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioTotal', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByProductoTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoTotal', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByProductoTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoTotal', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> sortByUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario', Sort.desc);
    });
  }
}

extension VentaModelQuerySortThenBy
    on QueryBuilder<VentaModel, VentaModel, QSortThenBy> {
  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cliente', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByClienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cliente', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByDescuentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descuento', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy>
      thenByEsSincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByInformacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informacion', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByInformacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informacion', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByPrecioTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioTotal', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByPrecioTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioTotal', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByProductoTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoTotal', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByProductoTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productoTotal', Sort.desc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario', Sort.asc);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QAfterSortBy> thenByUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario', Sort.desc);
    });
  }
}

extension VentaModelQueryWhereDistinct
    on QueryBuilder<VentaModel, VentaModel, QDistinct> {
  QueryBuilder<VentaModel, VentaModel, QDistinct> distinctByCliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cliente');
    });
  }

  QueryBuilder<VentaModel, VentaModel, QDistinct> distinctByDescuento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descuento');
    });
  }

  QueryBuilder<VentaModel, VentaModel, QDistinct> distinctByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esSincronizado');
    });
  }

  QueryBuilder<VentaModel, VentaModel, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<VentaModel, VentaModel, QDistinct> distinctByInformacion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'informacion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VentaModel, VentaModel, QDistinct> distinctByPrecioTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioTotal');
    });
  }

  QueryBuilder<VentaModel, VentaModel, QDistinct> distinctByProductoTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productoTotal');
    });
  }

  QueryBuilder<VentaModel, VentaModel, QDistinct> distinctByUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuario');
    });
  }
}

extension VentaModelQueryProperty
    on QueryBuilder<VentaModel, VentaModel, QQueryProperty> {
  QueryBuilder<VentaModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VentaModel, int?, QQueryOperations> clienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cliente');
    });
  }

  QueryBuilder<VentaModel, double, QQueryOperations> descuentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descuento');
    });
  }

  QueryBuilder<VentaModel, bool?, QQueryOperations> esSincronizadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esSincronizado');
    });
  }

  QueryBuilder<VentaModel, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<VentaModel, String?, QQueryOperations> informacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'informacion');
    });
  }

  QueryBuilder<VentaModel, List<ProductItemModel>, QQueryOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<VentaModel, double, QQueryOperations> precioTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioTotal');
    });
  }

  QueryBuilder<VentaModel, int, QQueryOperations> productoTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productoTotal');
    });
  }

  QueryBuilder<VentaModel, int, QQueryOperations> usuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuario');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ProductItemModelSchema = Schema(
  name: r'ProductItemModel',
  id: 7456034504976285148,
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
    r'id': PropertySchema(
      id: 6,
      name: r'id',
      type: IsarType.long,
    ),
    r'medida': PropertySchema(
      id: 7,
      name: r'medida',
      type: IsarType.string,
    ),
    r'precioUnitario': PropertySchema(
      id: 8,
      name: r'precioUnitario',
      type: IsarType.double,
    )
  },
  estimateSize: _productItemModelEstimateSize,
  serialize: _productItemModelSerialize,
  deserialize: _productItemModelDeserialize,
  deserializeProp: _productItemModelDeserializeProp,
);

int _productItemModelEstimateSize(
  ProductItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.codigoPrincipal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.descripcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.medida;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productItemModelSerialize(
  ProductItemModel object,
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
  writer.writeLong(offsets[6], object.id);
  writer.writeString(offsets[7], object.medida);
  writer.writeDouble(offsets[8], object.precioUnitario);
}

ProductItemModel _productItemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductItemModel(
    cantidad: reader.readLongOrNull(offsets[0]),
    cantidadProducto: reader.readLongOrNull(offsets[1]),
    codigoPrincipal: reader.readStringOrNull(offsets[2]),
    descripcion: reader.readStringOrNull(offsets[3]),
    esSincronizado: reader.readBoolOrNull(offsets[4]),
    fechaCreacion: reader.readDateTimeOrNull(offsets[5]),
    id: reader.readLongOrNull(offsets[6]),
    medida: reader.readStringOrNull(offsets[7]),
    precioUnitario: reader.readDoubleOrNull(offsets[8]),
  );
  return object;
}

P _productItemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ProductItemModelQueryFilter
    on QueryBuilder<ProductItemModel, ProductItemModel, QFilterCondition> {
  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cantidad',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cantidad',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadGreaterThan(
    int? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadLessThan(
    int? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadProductoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cantidadProducto',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadProductoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cantidadProducto',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadProductoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidadProducto',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadProductoGreaterThan(
    int? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadProductoLessThan(
    int? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      cantidadProductoBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codigoPrincipal',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codigoPrincipal',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalEqualTo(
    String? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalGreaterThan(
    String? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalLessThan(
    String? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codigoPrincipal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codigoPrincipal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoPrincipal',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      codigoPrincipalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codigoPrincipal',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionEqualTo(
    String? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionGreaterThan(
    String? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionLessThan(
    String? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      esSincronizadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'esSincronizado',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      esSincronizadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'esSincronizado',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      esSincronizadoEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esSincronizado',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      fechaCreacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaCreacion',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      fechaCreacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaCreacion',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      idGreaterThan(
    int? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      idLessThan(
    int? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      medidaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'medida',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      medidaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'medida',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      medidaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      medidaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medida',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      medidaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medida',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      medidaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medida',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      precioUnitarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precioUnitario',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      precioUnitarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precioUnitario',
      ));
    });
  }

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      precioUnitarioEqualTo(
    double? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      precioUnitarioGreaterThan(
    double? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      precioUnitarioLessThan(
    double? value, {
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

  QueryBuilder<ProductItemModel, ProductItemModel, QAfterFilterCondition>
      precioUnitarioBetween(
    double? lower,
    double? upper, {
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

extension ProductItemModelQueryObject
    on QueryBuilder<ProductItemModel, ProductItemModel, QFilterCondition> {}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metodo_pago_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMetodoPagoModelCollection on Isar {
  IsarCollection<MetodoPagoModel> get metodoPagoModels => this.collection();
}

const MetodoPagoModelSchema = CollectionSchema(
  name: r'MetodoPagoModel',
  id: -3428341120686136794,
  properties: {
    r'cantidad': PropertySchema(
      id: 0,
      name: r'cantidad',
      type: IsarType.long,
    ),
    r'esSincronizado': PropertySchema(
      id: 1,
      name: r'esSincronizado',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 2,
      name: r'estado',
      type: IsarType.string,
    ),
    r'factura': PropertySchema(
      id: 3,
      name: r'factura',
      type: IsarType.string,
    ),
    r'fechaCreacion': PropertySchema(
      id: 4,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaIngreso': PropertySchema(
      id: 5,
      name: r'fechaIngreso',
      type: IsarType.dateTime,
    ),
    r'fechaVencimiento': PropertySchema(
      id: 6,
      name: r'fechaVencimiento',
      type: IsarType.dateTime,
    ),
    r'itemCantidad': PropertySchema(
      id: 7,
      name: r'itemCantidad',
      type: IsarType.long,
    ),
    r'itemNombre': PropertySchema(
      id: 8,
      name: r'itemNombre',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 9,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'nota': PropertySchema(
      id: 10,
      name: r'nota',
      type: IsarType.string,
    )
  },
  estimateSize: _metodoPagoModelEstimateSize,
  serialize: _metodoPagoModelSerialize,
  deserialize: _metodoPagoModelDeserialize,
  deserializeProp: _metodoPagoModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _metodoPagoModelGetId,
  getLinks: _metodoPagoModelGetLinks,
  attach: _metodoPagoModelAttach,
  version: '3.1.0+1',
);

int _metodoPagoModelEstimateSize(
  MetodoPagoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.estado.length * 3;
  {
    final value = object.factura;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.itemNombre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.nota;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _metodoPagoModelSerialize(
  MetodoPagoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cantidad);
  writer.writeBool(offsets[1], object.esSincronizado);
  writer.writeString(offsets[2], object.estado);
  writer.writeString(offsets[3], object.factura);
  writer.writeDateTime(offsets[4], object.fechaCreacion);
  writer.writeDateTime(offsets[5], object.fechaIngreso);
  writer.writeDateTime(offsets[6], object.fechaVencimiento);
  writer.writeLong(offsets[7], object.itemCantidad);
  writer.writeString(offsets[8], object.itemNombre);
  writer.writeString(offsets[9], object.nombre);
  writer.writeString(offsets[10], object.nota);
}

MetodoPagoModel _metodoPagoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MetodoPagoModel(
    cantidad: reader.readLong(offsets[0]),
    esSincronizado: reader.readBoolOrNull(offsets[1]) ?? true,
    estado: reader.readString(offsets[2]),
    factura: reader.readStringOrNull(offsets[3]),
    fechaCreacion: reader.readDateTimeOrNull(offsets[4]),
    fechaIngreso: reader.readDateTime(offsets[5]),
    fechaVencimiento: reader.readDateTime(offsets[6]),
    id: id,
    itemCantidad: reader.readLong(offsets[7]),
    itemNombre: reader.readStringOrNull(offsets[8]),
    nombre: reader.readString(offsets[9]),
    nota: reader.readStringOrNull(offsets[10]),
  );
  return object;
}

P _metodoPagoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _metodoPagoModelGetId(MetodoPagoModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _metodoPagoModelGetLinks(MetodoPagoModel object) {
  return [];
}

void _metodoPagoModelAttach(
    IsarCollection<dynamic> col, Id id, MetodoPagoModel object) {
  object.id = id;
}

extension MetodoPagoModelQueryWhereSort
    on QueryBuilder<MetodoPagoModel, MetodoPagoModel, QWhere> {
  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MetodoPagoModelQueryWhere
    on QueryBuilder<MetodoPagoModel, MetodoPagoModel, QWhereClause> {
  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterWhereClause> idBetween(
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

extension MetodoPagoModelQueryFilter
    on QueryBuilder<MetodoPagoModel, MetodoPagoModel, QFilterCondition> {
  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      cantidadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      esSincronizadoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esSincronizado',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'factura',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'factura',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'factura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'factura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'factura',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'factura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'factura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'factura',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'factura',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factura',
        value: '',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      facturaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'factura',
        value: '',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaCreacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaCreacion',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaCreacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaCreacion',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaIngresoEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaIngreso',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaIngresoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaIngreso',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaIngresoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaIngreso',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaIngresoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaIngreso',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaVencimientoEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaVencimientoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaVencimientoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      fechaVencimientoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaVencimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemCantidadEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemCantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemCantidadGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemCantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemCantidadLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemCantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemCantidadBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemCantidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemNombre',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemNombre',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemNombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      itemNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nota',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nota',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nota',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nota',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nota',
        value: '',
      ));
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterFilterCondition>
      notaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nota',
        value: '',
      ));
    });
  }
}

extension MetodoPagoModelQueryObject
    on QueryBuilder<MetodoPagoModel, MetodoPagoModel, QFilterCondition> {}

extension MetodoPagoModelQueryLinks
    on QueryBuilder<MetodoPagoModel, MetodoPagoModel, QFilterCondition> {}

extension MetodoPagoModelQuerySortBy
    on QueryBuilder<MetodoPagoModel, MetodoPagoModel, QSortBy> {
  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByCantidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByEsSincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> sortByFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factura', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factura', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByFechaIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaIngreso', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByFechaIngresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaIngreso', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByFechaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByItemCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCantidad', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByItemCantidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCantidad', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByItemNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemNombre', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByItemNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemNombre', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> sortByNota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nota', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      sortByNotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nota', Sort.desc);
    });
  }
}

extension MetodoPagoModelQuerySortThenBy
    on QueryBuilder<MetodoPagoModel, MetodoPagoModel, QSortThenBy> {
  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByCantidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidad', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByEsSincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> thenByFactura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factura', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByFacturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factura', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByFechaIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaIngreso', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByFechaIngresoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaIngreso', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByFechaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByItemCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCantidad', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByItemCantidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCantidad', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByItemNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemNombre', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByItemNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemNombre', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy> thenByNota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nota', Sort.asc);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QAfterSortBy>
      thenByNotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nota', Sort.desc);
    });
  }
}

extension MetodoPagoModelQueryWhereDistinct
    on QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct> {
  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct>
      distinctByCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidad');
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct>
      distinctByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esSincronizado');
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct> distinctByFactura(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factura', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct>
      distinctByFechaIngreso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaIngreso');
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct>
      distinctByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaVencimiento');
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct>
      distinctByItemCantidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCantidad');
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct>
      distinctByItemNombre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemNombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MetodoPagoModel, MetodoPagoModel, QDistinct> distinctByNota(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nota', caseSensitive: caseSensitive);
    });
  }
}

extension MetodoPagoModelQueryProperty
    on QueryBuilder<MetodoPagoModel, MetodoPagoModel, QQueryProperty> {
  QueryBuilder<MetodoPagoModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MetodoPagoModel, int, QQueryOperations> cantidadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidad');
    });
  }

  QueryBuilder<MetodoPagoModel, bool, QQueryOperations>
      esSincronizadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esSincronizado');
    });
  }

  QueryBuilder<MetodoPagoModel, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<MetodoPagoModel, String?, QQueryOperations> facturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factura');
    });
  }

  QueryBuilder<MetodoPagoModel, DateTime?, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<MetodoPagoModel, DateTime, QQueryOperations>
      fechaIngresoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaIngreso');
    });
  }

  QueryBuilder<MetodoPagoModel, DateTime, QQueryOperations>
      fechaVencimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaVencimiento');
    });
  }

  QueryBuilder<MetodoPagoModel, int, QQueryOperations> itemCantidadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCantidad');
    });
  }

  QueryBuilder<MetodoPagoModel, String?, QQueryOperations>
      itemNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemNombre');
    });
  }

  QueryBuilder<MetodoPagoModel, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<MetodoPagoModel, String?, QQueryOperations> notaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nota');
    });
  }
}

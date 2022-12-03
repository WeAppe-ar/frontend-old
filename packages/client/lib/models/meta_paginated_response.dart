import 'dart:convert';
import 'dart:math';
import 'package:equatable/equatable.dart';

/// A reusable class for paginated responses.
class MetaPaginated<T> extends Equatable {
  /// The default constructor.
  const MetaPaginated({
    required this.total,
    required this.returned,
    required this.offset,
    required this.limit,
    this.items,
  });

  /// Returns a [MetaPaginated] parsed from a [Map].
  factory MetaPaginated.fromMap(
    Map<String, dynamic> map, {
    required T Function(Map<String, dynamic> item) itemConstructor,
  }) {
    map = map.cast<String, dynamic>();
    final meta = (map['meta'] as Map).cast<String, dynamic>();
    return MetaPaginated<T>(
      total: (meta['total'] as int?) ?? 0,
      returned: (meta['returned'] as int?) ?? 0,
      offset: (meta['offset'] as int?) ?? 0,
      limit: (meta['limit'] as int?) ?? 0,
      // ignore: unnecessary_lambdas
      items: map['items'] != null
          ? ((map['items'] as List).cast<Map<String, dynamic>>())
              .map<T>(
                itemConstructor,
              )
              .toList()
          : null,
    );
  }

  /// Generates an empty [MetaPaginated] object.
  factory MetaPaginated.empty() => MetaPaginated<T>(
        limit: 0,
        offset: 0,
        returned: 0,
        total: 0,
        items: const [],
      );

  /// Creates a new instance of [MetaPaginated] by merging two [MetaPaginated].
  MetaPaginated<T> merge(MetaPaginated<T> other) {
    return MetaPaginated<T>(
      returned: returned + other.returned,
      offset: (returned + other.returned) - 1,
      total: max(total, other.total),
      limit: limit,
      items: [
        ...?items,
        ...?other.items,
      ],
    );
  }

  /// Total number of available records
  final int total;

  /// Number of records returned <= limit
  final int returned;

  /// Starting record offset from zero
  final int offset;

  /// Total number of records to return
  final int limit;

  /// List of records
  final List<T>? items;

  @override
  List<Object?> get props {
    return [
      total,
      returned,
      offset,
      limit,
      items,
    ];
  }
}

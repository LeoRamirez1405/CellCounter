class Sample {
  final String date;
  final String name;
  final double volume;
  final double dilution;
  final int quadrants;
  final int vivas;
  final int muertas;
  final int? id; // Hacer que el id sea opcional

  Sample({
    required this.date,
    required this.name,
    required this.volume,
    required this.dilution,
    required this.quadrants,
    required this.vivas,
    required this.muertas,
    this.id, // El id es opcional
  });

  int get total => muertas + vivas;
  double get viabilidad => (vivas / total) * 100;
  double get cellTotalesConcentradas => (vivas / quadrants) * dilution * 10000;
  double get totalCellHomogenado => cellTotalesConcentradas * volume;
  double get volAtomar =>
      (_concentracionSiembra * _volumenSiembra) / cellTotalesConcentradas;

  double _concentracionSiembra = 0.0;
  double _volumenSiembra = 0.0;

  double get concentracionSiembra => _concentracionSiembra;
  set concentracionSiembra(double value) {
    _concentracionSiembra = value;
  }

  double get volumenSiembra => _volumenSiembra;
  set volumenSiembra(double value) {
    _volumenSiembra = value;
  }

  Map<String, dynamic> toMap() {
    var map = {
      'date': date,
      'name': name,
      'volume': volume,
      'dilution': dilution,
      'quadrants': quadrants,
      'vivas': vivas,
      'muertas': muertas,
    };
    if (id != null) {
      map['id'] = id as Object;
    }
    return map;
  }

  factory Sample.fromMap(Map<String, dynamic> map) {
    return Sample(
      date: map['date'],
      name: map['name'],
      volume: map['volume'],
      dilution: map['dilution'],
      quadrants: map['quadrants'],
      vivas: map['vivas'],
      muertas: map['muertas'],
      id: map['id'],
    );
  }
}

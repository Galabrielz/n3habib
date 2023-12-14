import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PessoaRecord extends FirestoreRecord {
  PessoaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  double? _altura;
  double get altura => _altura ?? 0.0;
  bool hasAltura() => _altura != null;

  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  double? _imc;
  double get imc => _imc ?? 0.0;
  bool hasImc() => _imc != null;

  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  void _initializeFields() {
    _altura = castToType<double>(snapshotData['Altura']);
    _peso = castToType<double>(snapshotData['Peso']);
    _imc = castToType<double>(snapshotData['IMC']);
    _nome = snapshotData['Nome'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pessoa');

  static Stream<PessoaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PessoaRecord.fromSnapshot(s));

  static Future<PessoaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PessoaRecord.fromSnapshot(s));

  static PessoaRecord fromSnapshot(DocumentSnapshot snapshot) => PessoaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PessoaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PessoaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PessoaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PessoaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPessoaRecordData({
  double? altura,
  double? peso,
  double? imc,
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Altura': altura,
      'Peso': peso,
      'IMC': imc,
      'Nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class PessoaRecordDocumentEquality implements Equality<PessoaRecord> {
  const PessoaRecordDocumentEquality();

  @override
  bool equals(PessoaRecord? e1, PessoaRecord? e2) {
    return e1?.altura == e2?.altura &&
        e1?.peso == e2?.peso &&
        e1?.imc == e2?.imc &&
        e1?.nome == e2?.nome;
  }

  @override
  int hash(PessoaRecord? e) =>
      const ListEquality().hash([e?.altura, e?.peso, e?.imc, e?.nome]);

  @override
  bool isValidKey(Object? o) => o is PessoaRecord;
}

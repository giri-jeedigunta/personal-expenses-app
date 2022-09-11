// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final int typeId = 1;

  @override
  Expense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expense(
      id: fields[0] as String,
      details: fields[1] as String,
      amount: fields[2] as double,
      expenseDate: fields[3] as DateTime,
      createdOn: fields[4] as DateTime,
      category: fields[5] as String?,
      month: fields[6] as String,
      weekNo: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.details)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.expenseDate)
      ..writeByte(4)
      ..write(obj.createdOn)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.month)
      ..writeByte(7)
      ..write(obj.weekNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

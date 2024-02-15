part of 'product_bloc.dart';

class GetProductsEvent extends MyEvent {}

class GetProductEvent extends MyEvent {
  final int id;
  GetProductEvent(this.id);
}

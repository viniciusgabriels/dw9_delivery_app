import 'package:dw9_delivery_app/app/dto/order.dto.dart';
import 'package:dw9_delivery_app/app/models/payment_type_model.dart';

abstract class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentTypes();
  Future<void> saveOrder(OrderDto order);
}

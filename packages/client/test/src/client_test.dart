import 'package:client/client.dart';
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';

void main() async {
  final client = Client(authority: 'localhost:8080');
  final login = await client.login(
    email: 'cavazzonnazareno@gmail.com',
    password: 'Prueba123!',
  );
  print(login);
}

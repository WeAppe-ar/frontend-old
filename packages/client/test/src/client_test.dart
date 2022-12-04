import 'package:client/client.dart';
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';

void main() async {
  final client = Client(
    authority: 'localhost:8080',
    token:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Mzg4Mjg3ZGJkMjYwMGJjMDE5YTUxM2MiLCJyZWZyZXNoVG9rZW5JZCI6IjYzODhiYjQzM2M2YTQ3ZWU3NmVjOGU1YSIsImlhdCI6MTY2OTkwNTIxOSwiZXhwIjoxNjcwNTEwMDE5LCJpc3MiOiJodHRwczovL3dlYXBwZS5hciJ9.ow-Vf0rYHBaXInORQLWFGl3UtaSt_j-hfjFg4-nmK5w',
  );
  // final login = await client.login(
  //   email: 'cavazzonnazareno@gmail.com',
  //   password: 'Prueba123!',
  // );
  final records = await client.createOrganization(name: 'LW', color: '#CCCCCC');
  print(records);
}

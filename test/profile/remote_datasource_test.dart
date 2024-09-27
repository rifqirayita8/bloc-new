import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_practice_bloc/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:my_practice_bloc/features/profile/data/models/profile_model.dart';
import 'package:my_practice_bloc/features/profile/domain/usecases/profile_params.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<ProfileRemoteDatasource>()])
import 'remote_datasource_test.mocks.dart';

void main() async {
  // Create mock object.
  var remoteDataSource = MockProfileRemoteDatasource();

  const int userId= 1;
  GetUserParams params= GetUserParams(id: userId);

  ProfileModel fakeProfileModel= const ProfileModel(
    id: userId, 
    first_name: 'Joko', 
    last_name: 'Widodo', 
    email: 'mulyono@gmail.com', 
    avatar: 'ikn.jpg/$userId'
  );

  group('Profile Remote Data Source', () {
    test('Berhasil', () async {
      when(remoteDataSource.getUser(params)).thenAnswer(
        (_) async => fakeProfileModel
      );
      try {
        var response = await remoteDataSource.getUser(params);
        expect(response, fakeProfileModel);
        print(response.toJson());
      } catch(e) {
        print(e);
        fail('Impossible');
      }
    });

    test('Gagal', () async {
      when(remoteDataSource.getUser(params)).thenThrow(Exception());
      try {
        await remoteDataSource.getUser(params);
        print('impossible');
        fail('impossible');
      } catch(e) {
        print('harus gagal: $e');
        expect(e, isException);
      }
    });
  }); 
}
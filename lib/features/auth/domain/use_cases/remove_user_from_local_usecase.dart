import '../repositories/user_repo.dart';

class RemoveUserFromLocalUsecase {
  final UserRepo userRepo;

  RemoveUserFromLocalUsecase(this.userRepo);

  Future call() async {
    return await userRepo.removeUserFromLocalRepo();
  }
}

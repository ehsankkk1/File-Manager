import '../repositories/user_repo.dart';

class GetUserFromLocalUsecase {
  final UserRepo userRepo;

  GetUserFromLocalUsecase(this.userRepo);

  Future call() async {
    return await userRepo.getUserFromLocalRepo();
  }
}

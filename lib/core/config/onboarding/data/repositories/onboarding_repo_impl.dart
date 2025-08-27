import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/core/config/onboarding/data/datasource/onboard_datasource.dart';
import 'package:chhoto_khabar/core/config/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';



class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardDatasource onboardDatasource;

  OnboardingRepositoryImpl(this.onboardDatasource);

  @override
  Future<Either<AppException, bool>> isOnboard() async {
    return await onboardDatasource.isOnboard();
  }

  @override
  Future<Either<AppException, bool>> setOnboardStatus() async {
    return await onboardDatasource.setOnboardStatus();
  }
}

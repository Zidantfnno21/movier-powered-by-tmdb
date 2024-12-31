import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:the_movie_databases/data/local/databases/entity/account/account.dart';
import 'package:the_movie_databases/data/local/databases/entity/account/account_details.dart';
import 'package:the_movie_databases/data/repositories/account/account_repository.dart';
import 'package:the_movie_databases/data/repositories/auth/auth_repository.dart';

import '../../../utils/result.dart';

class AccountViewModel with ChangeNotifier{
  AccountViewModel({
    required AccountRepository accountRepository,
    required AuthRepository authRepository,
}) : _accountRepository = accountRepository, _authRepository = authRepository;

  final AuthRepository _authRepository;
  final AccountRepository _accountRepository;
  final _log = Logger('AccountViewModel');

  Account? _account;

  Account? get account => _account;

  Future<Result<void>> fetchAccount() async {
    final response = await _accountRepository.fetchAccount();
    
    switch(response) {
      case Ok<AccountDetails>():
        final accountDetails = response.value.toAccount();
        _account = accountDetails;
        _log.fine(accountDetails);
        notifyListeners();
        return const Result.ok(null);
      case Error<AccountDetails>():
        _log.warning('Error fetching account details: ${response.error}');
        return Result.error(response.error);
    }
  }

  Future<Result<void>> logout() async {
    final result = await _authRepository.logOut();
    if (result is Error<void>) {
      _log.warning('Logout failed! ${result.error}');
    }
    return result;
  }
  
  
}
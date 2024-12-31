import 'package:the_movie_databases/data/local/databases/entity/account/account.dart';
import 'package:the_movie_databases/data/local/databases/entity/account/account_details.dart';

import '../../../utils/result.dart';

abstract class AccountRepository{
  Future<Result<AccountDetails>> fetchAccount();
  Future<void> insertAccountToDb(Account account);
  Future<Account?> fetchAccountFromDb();
}
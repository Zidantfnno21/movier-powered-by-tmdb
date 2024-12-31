import 'package:floor/floor.dart';

import '../entity/account/account.dart';

@dao
abstract class AccountDao {
  @Query('SELECT * FROM account')
  Future<Account?> getAccount();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateAccount(Account account);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAccount(Account account);

  @Query('DELETE FROM account')
  Future<void> deleteAccount();

}
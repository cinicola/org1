@isTest(isParallel=true)
private class StrongDMLTest {

	@isTest
	static void test() {
		Account account = new Account(Name = 'Test');
		StrongDML.doInsert(account);
		StrongDML.doUpdate(account);
		StrongDML.doDelete(account);
	}
}
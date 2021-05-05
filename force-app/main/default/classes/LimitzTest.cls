@isTest(isParallel=true)
public class LimitzTest {

	@isTest
	static void test() {
		System.assert(Limitz.getRemainingAggregateQueries().percentage > 0);
		System.assert(Limitz.getRemainingAsyncCalls().percentage > 0);
		System.assert(Limitz.getRemainingCallouts().percentage > 0);
		System.assert(Limitz.getRemainingCpuTime().percentage > 0);
		System.assert(Limitz.getRemainingDMLRows().percentage > 0);
		System.assert(Limitz.getRemainingDMLStatements().percentage > 0);
		System.assert(Limitz.getRemainingEmailInvocations().percentage > 0);
		System.assert(Limitz.getRemainingFutureCalls().percentage > 0);
		System.assert(Limitz.getRemainingHeapSize().percentage > 0);
		System.assert(Limitz.getRemainingMobilePushApexCalls().percentage > 0);
		System.assert(Limitz.getRemainingQueries().percentage > 0);
		System.assert(Limitz.getRemainingQueryLocatorRows().percentage > 0);
		System.assert(Limitz.getRemainingQueryRows().percentage > 0);
		System.assert(Limitz.getRemainingQueueableJobs().percentage > 0);
		System.assert(Limitz.getRemainingSoslQueries().percentage > 0);
	}
}
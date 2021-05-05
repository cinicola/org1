public class Limitz {
	public static Remaining getRemainingAggregateQueries() {
		return calcRemaining(Limits.getLimitAggregateQueries(), Limits.getAggregateQueries());
	}

	public static Remaining getRemainingAsyncCalls() {
		return calcRemaining(Limits.getLimitAsyncCalls(), Limits.getAsyncCalls());
	}

	public static Remaining getRemainingCallouts() {
		return calcRemaining(Limits.getLimitCallouts(), Limits.getCallouts());
	}

	public static Remaining getRemainingCpuTime() {
		return calcRemaining(Limits.getLimitCpuTime(), Limits.getCpuTime());
	}

	public static Remaining getRemainingDMLRows() {
		return calcRemaining(Limits.getLimitDMLRows(), Limits.getDMLRows());
	}

	public static Remaining getRemainingDMLStatements() {
		return calcRemaining(Limits.getLimitDMLStatements(), Limits.getDMLStatements());
	}

	public static Remaining getRemainingEmailInvocations() {
		return calcRemaining(Limits.getLimitEmailInvocations(), Limits.getEmailInvocations());
	}

	public static Remaining getRemainingFutureCalls() {
		return calcRemaining(Limits.getLimitFutureCalls(), Limits.getFutureCalls());
	}

	public static Remaining getRemainingHeapSize() {
		return calcRemaining(Limits.getLimitHeapSize(), Limits.getHeapSize());
	}

	public static Remaining getRemainingMobilePushApexCalls() {
		return calcRemaining(Limits.getLimitMobilePushApexCalls(), Limits.getMobilePushApexCalls());
	}

	public static Remaining getRemainingQueries() {
		return calcRemaining(Limits.getLimitQueries(), Limits.getQueries());
	}

	public static Remaining getRemainingQueryLocatorRows() {
		return calcRemaining(Limits.getLimitQueryLocatorRows(), Limits.getQueryLocatorRows());
	}

	public static Remaining getRemainingQueryRows() {
		return calcRemaining(Limits.getLimitQueryRows(), Limits.getQueryRows());
	}

	public static Remaining getRemainingQueueableJobs() {
		return calcRemaining(Limits.getLimitQueueableJobs(), Limits.getQueueableJobs());
	}

	public static Remaining getRemainingSoslQueries() {
		return calcRemaining(Limits.getLimitSoslQueries(), Limits.getSoslQueries());
	}

	private static Integer calcPercentage(Integer total, Integer used) {
		return (total-used)*100/total;
	}

	private static Remaining calcRemaining(Integer total, Integer used) {
		return new Remaining(calcPercentage(total, used), total-used);
	}

	public class Remaining {
		public Integer percentage {get;set;}
		public Integer absolute {get;set;}

		public Remaining(Integer percentage, Integer absolute) {
			this.percentage = percentage;
			this.absolute = absolute;
		}
	}
}
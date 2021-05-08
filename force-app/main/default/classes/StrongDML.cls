public class StrongDML {
	private enum Operation {INS, DEL, UPD, UPS}

	public static void doInsert(SObject obj) {
		forceDML(obj, Operation.INS);
	}

	public static void doUpdate(SObject obj) {
		forceDML(obj, Operation.UPD);
	}
	public static void doUpsert(SObject obj) {
		forceDML(obj, Operation.UPS);
	}

	public static void doDelete(SObject obj) {
		forceDML(obj, Operation.DEL);
	}

	private static void forceDML(SObject obj, StrongDML.Operation operation) {
		while (true) {
			try {
				switch on operation {
					when INS {
						insert obj;
					}
					when UPD {
						update obj;
					}
					when UPS {
						upsert obj;
					}
					when DEL {
						delete obj;
					}
				}
				return;
			}
			catch(Exception e) {
				System.Debug('>>>> e.getMessage() = ((' + e.getMessage() + '))');

				Boolean dmlExceeded = Limitz.getRemainingDMLStatements().percentage <= 30;
				Boolean cpuExceeded = Limitz.getRemainingCpuTime().percentage <= 30;
				Boolean lockError = e.getMessage().contains('UNABLE_TO_LOCK_ROW');
				if (!lockError || dmlExceeded || cpuExceeded) {
					throw e;
				}
			}
		}
	}
}
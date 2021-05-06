public class StrongDML {
	private enum Operation {INS, DEL, UPD}

	public static void doInsert(SObject obj) {
		forceDML(obj, Operation.INS);
	}

	public static void doUpdate(SObject obj) {
		forceDML(obj, Operation.UPD);
	}

	public static void doDelete(SObject obj) {
		forceDML(obj, Operation.DEL);
	}

	private static void forceDML(SObject obj, StrongDML.Operation operation) {
		while (Limitz.getRemainingDMLStatements().percentage >= 90) {
			try {
				switch on operation {
					when INS {
						insert obj;
					}
					when UPD {
						update obj;
					}
					when DEL {
						delete obj;
					}
				}
				break;
			}
			catch(Exception e) {
				System.Debug('>>>> e.getMessage() = ((' + e.getMessage() + '))');
			}
		}
	}
}
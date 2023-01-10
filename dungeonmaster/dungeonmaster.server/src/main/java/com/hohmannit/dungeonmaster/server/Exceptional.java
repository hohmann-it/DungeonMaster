package com.hohmannit.dungeonmaster.server;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.postgresql.util.PSQLException;

public class Exceptional {
	public static void handle(Throwable e) {
		Throwable cause = e.getCause();
		if (cause instanceof org.postgresql.util.PSQLException) {
			PSQLException exception = (PSQLException) cause;
			String sqlState = exception.getSQLState();
			switch (sqlState) {
			case "23503": {
				throw new VetoException(TEXTS.get("Fehler_Server_Sql_FKDelete"));
			}
			case "23505": {
				throw new VetoException(TEXTS.get("Fehler_Server_Sql_Unique"));
			}
			default:
				throw new VetoException(TEXTS.get("Fehler_Server_Sql_Undefined", exception.getMessage()));
			}
		}
	}
}

package com.hohmannit.dungeonmaster.server.datenbank.zauber.wirkungsdauer;

public interface WirkungsdauerSQLs {
	String WIRKUNGSDAUER_LOOKUP = "SELECT wirkungsdauer_id, typ FROM dd.wirkungsdauer WHERE 1 = 1 "
			+ "<key>    AND wirkungsdauer_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

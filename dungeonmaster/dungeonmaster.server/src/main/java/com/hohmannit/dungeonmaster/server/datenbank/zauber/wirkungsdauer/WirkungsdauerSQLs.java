package com.hohmannit.dungeonmaster.server.datenbank.zauber.wirkungsdauer;

public interface WirkungsdauerSQLs {
	String WIRKUNGSDAUERTYP_LOOKUP = "SELECT wirkungsdauertyp_id, typ FROM dd.wirkungsdauertyp WHERE 1 = 1 "
			+ "<key>    AND wirkungsdauertyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

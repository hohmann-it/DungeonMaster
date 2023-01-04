package com.hohmannit.dungeonmaster.server.datenbank.zauber.reichweite;

public interface ReichweiteSQLs {

	String REICHWEITETYP_LOOKUP = "SELECT reichweitetyp_id, typ_lang FROM dd.reichweitetyp WHERE 1 = 1 "
			+ "<key>    AND reichweitetyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ_lang) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

package com.hohmannit.dungeonmaster.server.datenbank.zauber.reichweite;

public interface ReichweiteSQLs {

	String REICHWEITE_PAGE_SELECT = "SELECT reichweite_id, typ_lang, typ_kurz, beschreibung"
			+ "	FROM dd.reichweite;";

	String REICHWEITE_PAGE_SELECT_INTO = " INTO :{page.id}, :{page.typLang}, :{page.typKurz}, :{page.beschreibung}";

	String REICHWEITE_INSERT = "INSERT INTO dd.reichweite(typ_lang, typ_kurz, beschreibung)	VALUES (:typLang, :typKurz, :beschreibung);";

	String REICHWEITE_UPDATE = "UPDATE dd.reichweite SET typ_lang=:typLang, typ_kurz=:typKurz, beschreibung=:beschreibung	WHERE reichweite_id = :reichweiteId;";

	String REICHWEITE_SELECT = "SELECT typ_lang, typ_kurz, beschreibung FROM dd.reichweite WHERE reichweite_id = :reichweiteId INTO :typLang, :typKurz, :beschreibung;";

	String REICHWEITE_DELETE = "DELETE FROM dd.reichweite WHERE reichweite_id = :reichweiteId;";

	String REICHWEITE_LOOKUP = "SELECT reichweite_id, typ_lang FROM dd.reichweite WHERE 1 = 1 "
			+ "<key>    AND reichweite_id = :key </key> " //
			+ "<text>   AND UPPER(typ_lang) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

package com.hohmannit.dungeonmaster.server.datenbank.zauber.reichweite;

public interface ReichweiteSQLs {

	String REICHWEITE_PAGE_SELECT = "SELECT id, lang, kurz, beschreibung" + "	FROM dd.reichweite;";

	String REICHWEITE_PAGE_SELECT_INTO = " INTO :{page.id}, :{page.lang}, :{page.kurz}, :{page.beschreibung}";

	String REICHWEITE_INSERT = "INSERT INTO dd.reichweite(lang, kurz, beschreibung)	VALUES (:lang, :kurz, :beschreibung);";

	String REICHWEITE_UPDATE = "UPDATE dd.reichweite SET lang=:lang, kurz=:kurz, beschreibung=:beschreibung	WHERE id = :id;";

	String REICHWEITE_SELECT = "SELECT lang, kurz, beschreibung FROM dd.reichweite WHERE id = :id INTO :lang, :kurz, :beschreibung;";

	String REICHWEITE_DELETE = "DELETE FROM dd.reichweite WHERE id = :id;";

	String REICHWEITE_LOOKUP = "SELECT id, lang FROM dd.reichweite WHERE 1 = 1 " + "<key>    AND id = :key </key> " //
			+ "<text>   AND UPPER(lang) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

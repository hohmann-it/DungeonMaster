package com.hohmannit.dungeonmaster.server.datenbank.zauber.wirkungsdauer;

public interface WirkungsdauerSQLs {

	String WIRKUNGSDAUER_PAGE_SELECT = "SELECT id, name, beschreibung" + "	FROM dd.wirkungsdauer;";

	String WIRKUNGSDAUER_PAGE_SELECT_INTO = " INTO :{page.id}, :{page.name}, :{page.beschreibung}";

	String WIRKUNGSDAUER_INSERT = "INSERT INTO dd.wirkungsdauer(name, beschreibung)	VALUES (:name, :beschreibung);";

	String WIRKUNGSDAUER_UPDATE = "UPDATE dd.wirkungsdauer SET name=:name, beschreibung=:beschreibung	WHERE id = :id;";

	String WIRKUNGSDAUER_SELECT = "SELECT name, beschreibung FROM dd.wirkungsdauer WHERE id = :id INTO :name, :beschreibung;";

	String WIRKUNGSDAUER_DELETE = "DELETE FROM dd.wirkungsdauer WHERE id = :id;";

	String WIRKUNGSDAUER_LOOKUP = "SELECT id, name FROM dd.wirkungsdauer WHERE 1 = 1 "
			+ "<key>    AND id = :key </key> " //
			+ "<text>   AND UPPER(name) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

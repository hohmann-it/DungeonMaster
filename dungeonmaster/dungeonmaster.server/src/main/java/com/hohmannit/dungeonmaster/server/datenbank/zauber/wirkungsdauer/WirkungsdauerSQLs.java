package com.hohmannit.dungeonmaster.server.datenbank.zauber.wirkungsdauer;

public interface WirkungsdauerSQLs {

	String WIRKUNGSDAUER_PAGE_SELECT = "SELECT wirkungsdauer_id, typ, beschreibung" + "	FROM dd.wirkungsdauer;";

	String WIRKUNGSDAUER_PAGE_SELECT_INTO = " INTO :{page.id}, :{page.typ}, :{page.beschreibung}";

	String WIRKUNGSDAUER_INSERT = "INSERT INTO dd.wirkungsdauer(typ, beschreibung)	VALUES (:typ, :beschreibung);";

	String WIRKUNGSDAUER_UPDATE = "UPDATE dd.wirkungsdauer SET typ=:typ, beschreibung=:beschreibung	WHERE wirkungsdauer_id = :wirkungsdauerId;";

	String WIRKUNGSDAUER_SELECT = "SELECT typ, beschreibung FROM dd.wirkungsdauer WHERE wirkungsdauer_id = :wirkungsdauerId INTO :typ, :beschreibung;";

	String WIRKUNGSDAUER_DELETE = "DELETE FROM dd.wirkungsdauer WHERE wirkungsdauer_id = :wirkungsdauerId;";

	String WIRKUNGSDAUER_LOOKUP = "SELECT wirkungsdauer_id, typ FROM dd.wirkungsdauer WHERE 1 = 1 "
			+ "<key>    AND wirkungsdauer_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

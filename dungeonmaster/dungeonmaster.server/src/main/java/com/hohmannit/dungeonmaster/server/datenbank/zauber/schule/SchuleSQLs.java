package com.hohmannit.dungeonmaster.server.datenbank.zauber.schule;

public interface SchuleSQLs {

	String SCHULE_PAGE_SELECT = "SELECT schule_id, typ, kategorie, beschreibung" + "	FROM dd.schule;";

	String SCHULE_PAGE_SELECT_INTO = " INTO :{page.id}, :{page.typ}, :{page.kategorie}, :{page.beschreibung}";

	String SCHULE_INSERT = "INSERT INTO dd.schule(typ, kategorie, beschreibung)	VALUES (:typ, :kategorie, :beschreibung);";

	String SCHULE_UPDATE = "UPDATE dd.schule SET typ=:typ, kategorie=:kategorie, beschreibung=:beschreibung	WHERE schule_id = :schuleId;";

	String SCHULE_SELECT = "SELECT typ, kategorie, beschreibung FROM dd.schule WHERE schule_id = :schuleId INTO :typ, :kategorie, :beschreibung;";

	String SCHULE_DELETE = "DELETE FROM dd.schule WHERE schule_id = :schuleId;";

	String SCHULE_LOOKUP = "SELECT schule_id, typ FROM dd.schule WHERE 1 = 1 " + "<key>    AND schule_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

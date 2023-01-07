package com.hohmannit.dungeonmaster.server.datenbank.zauber.schule;

public interface SchuleSQLs {

	String SCHULE_PAGE_SELECT = "SELECT id, name, kategorie, beschreibung" + "	FROM dd.schule;";

	String SCHULE_PAGE_SELECT_INTO = " INTO :{page.id}, :{page.name}, :{page.kategorie}, :{page.beschreibung}";

	String SCHULE_INSERT = "INSERT INTO dd.schule(name, kategorie, beschreibung)	VALUES (:name, :kategorie, :beschreibung);";

	String SCHULE_UPDATE = "UPDATE dd.schule SET name=:name, kategorie=:kategorie, beschreibung=:beschreibung	WHERE id = :id;";

	String SCHULE_SELECT = "SELECT name, kategorie, beschreibung FROM dd.schule WHERE id = :id INTO :name, :kategorie, :beschreibung;";

	String SCHULE_DELETE = "DELETE FROM dd.schule WHERE id = :id;";

	String SCHULE_LOOKUP = "SELECT id, name FROM dd.schule WHERE 1 = 1 " + "<key>    AND id = :key </key> " //
			+ "<text>   AND UPPER(name) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

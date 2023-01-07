package com.hohmannit.dungeonmaster.server.datenbank.zauber.zeitaufwand;

public interface ZeitaufwandSQLs {

	String ZEITAUFWAND_LOOKUP = "SELECT id, name FROM dd.zeitaufwand WHERE 1 = 1 " //
			+ "<key>    AND id = :key </key> " //
			+ "<text>   AND UPPER(name) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String ZEITAUFWAND_PAGE_SELECT = "SELECT id, name, beschreibung" + "	FROM dd.zeitaufwand;";

	String ZEITAUFWAND_PAGE_SELECT_INTO = " INTO :{page.id}, :{page.name}, :{page.beschreibung}";

	String ZEITAUFWAND_INSERT = "INSERT INTO dd.zeitaufwand(name, beschreibung)	VALUES (:name, :beschreibung);";

	String ZEITAUFWAND_UPDATE = "UPDATE dd.zeitaufwand SET name=:name, beschreibung=:beschreibung WHERE id = :zeitaufwandId;";

	String ZEITAUFWAND_SELECT = "SELECT name, beschreibung FROM dd.zeitaufwand WHERE id = :id INTO :name, :beschreibung;";

	String ZEITAUFWAND_DELETE = "DELETE FROM dd.zeitaufwand WHERE id = :id";
}

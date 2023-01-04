package com.hohmannit.dungeonmaster.server.datenbank.zauber.zeitaufwand;

public interface ZeitaufwandSQLs {

	String ZEITAUFWANDTYP_LOOKUP = "SELECT zeitaufwandtyp_id, typ FROM dd.zeitaufwandtyp WHERE 1 = 1 "
			+ "<key>    AND zeitaufwandtyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String ZEITAUFWANDTYP_PAGE_SELECT = "SELECT zeitaufwandtyp_id, typ, beschreibung" + "	FROM dd.zeitaufwandtyp;";

	String ZEITAUFWANDTYP_PAGE_SELECT_INTO = " INTO :{page.id}, :{page.typ}, :{page.beschreibung}";

	String ZEITAUFWANDTYP_INSERT = "CALL dd.insert_zeitaufwandtyp(:typ, :beschreibung);";

	String ZEITAUFWANDTYP_UPDATE = "UPDATE dd.zeitaufwandtyp SET typ=:typ, beschreibung=:beschreibung WHERE zeitaufwandtyp_id = :zeitaufwandtypId;";

	String ZEITAUFWANDTYP_SELECT = "SELECT typ, beschreibung FROM dd.zeitaufwandtyp WHERE zeitaufwandtyp_id = :zeitaufwandtypId INTO :typ, :beschreibung;";

	String ZEITAUFWANDTYP_DELETE = "DELETE FROM dd.zeitaufwandtyp WHERE zeitaufwandtyp_id = :zeitaufwandtypId";
}

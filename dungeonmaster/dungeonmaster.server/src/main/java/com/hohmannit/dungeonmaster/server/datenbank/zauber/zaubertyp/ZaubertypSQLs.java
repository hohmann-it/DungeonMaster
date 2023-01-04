package com.hohmannit.dungeonmaster.server.datenbank.zauber.zaubertyp;

public interface ZaubertypSQLs {

	String ZAUBERTYP_PAGE_SELECT = "SELECT zaubertyp_id, typ, kategorie" + "	FROM dd.zaubertyp;";

	String ZAUBERTYP_PAGE_SELECT_INTO = " INTO :{page.id}, :{page.typ}, :{page.kategorie}";

	String ZAUBERTYP_INSERT = "INSERT INTO dd.zaubertyp(typ, kategorie)	VALUES (:typ, :kategorie);";

	String ZAUBERTYP_UPDATE = "UPDATE dd.zaubertyp SET typ=:typ, kategorie=:kategorie	WHERE zaubertyp_id = :zaubertypId;";

	String ZAUBERTYP_SELECT = "SELECT typ, kategorie FROM dd.zaubertyp WHERE zaubertyp_id = :zaubertypId INTO :typ, :kategorie;";

	String ZAUBERTYP_DELETE = "DELETE FROM dd.zaubertyp WHERE zaubertyp_id = :zaubertypId;";

	String ZAUBERTYP_LOOKUP = "SELECT zaubertyp_id, typ FROM dd.zaubertyp WHERE 1 = 1 "
			+ "<key>    AND zaubertyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

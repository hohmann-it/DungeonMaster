package com.hohmannit.dungeonmaster.server.datenbank.zauber.zaubermaterial;

public interface ZaubermaterialSQLs {
	String ZAUBERMATERIAL_LOOKUP = "SELECT gegenstand_id, name FROM dd.gegenstand WHERE 1 = 1 "
			+ "<key>    AND gegenstand_id = :key </key> " //
			+ "<text>   AND UPPER(name) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String ZAUBERMATERIAL_ERSATZ_LOOKUP = "SELECT zaubermaterial_id, (SELECT name FROM dd.gegenstand WHERE gegenstand_id = fk_gegenstand) as name FROM dd.zaubermaterial WHERE 1 = 1 "
			+ "<key>    AND zaubermaterial_id = :key </key> " //
			+ "<text>   AND UPPER(name) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

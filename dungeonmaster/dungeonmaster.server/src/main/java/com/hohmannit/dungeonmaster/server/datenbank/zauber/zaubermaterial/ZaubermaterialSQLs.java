package com.hohmannit.dungeonmaster.server.datenbank.zauber.zaubermaterial;

public interface ZaubermaterialSQLs {
	String ZAUBERMATERIAL_LOOKUP = "SELECT gegenstand_id, name FROM dd.gegenstand WHERE 1 = 1 "
			+ "<key>    AND gegenstand_id = :key </key> " //
			+ "<text>   AND UPPER(name) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String ZAUBERMATERIAL_ERSATZ_LOOKUP = "SELECT id, (SELECT name FROM dd.gegenstand WHERE gegenstand_id = fk_gegenstand) as name FROM dd.zaubermaterial WHERE 1 = 1 "
			+ "<key>    AND id = :key </key> " //
			+ "<text>   AND UPPER(name) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
	String ZAUBERMATERIAL_SELECT = "" //
			+ "SELECT" //
			+ "				zm.id, " //
			+ "				zm.fk_gegenstand, " //
			+ "				g.wert, " //
			+ "				zm.anzahl, " //
			+ "				g.gewicht " //
			+ "FROM         dd.zaubermaterial zm INNER JOIN dd.gegenstand g ON zm.fk_gegenstand = g.gegenstand_id WHERE fk_zauber = :id " //
			+ "INTO         :{ZaubkomponentenTable.id}," //
			+ "				:{ZaubkomponentenTable.name}," //
			+ "				:{ZaubkomponentenTable.wert},"//
			+ "				:{ZaubkomponentenTable.anzahl},"//
			+ "				:{ZaubkomponentenTable.gewicht}";
}

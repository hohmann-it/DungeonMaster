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
	String ZAUBERMATERIAL_INSERT = "INSERT INTO dd.zaubermaterial(fk_zauber, fk_gegenstand, anzahl, wird_verbraucht	)" //
			+ "	VALUES (:zauberId, :gegenstand, :anzahl, :wirdVerbraucht);";
	String ZAUBERMATERIAL_DELETE = "DELETE FROM dd.zaubermaterial WHERE id=:id";
	String ZAUBERMATERIAL_SELECT = "SELECT fk_gegenstand, anzahl, wird_verbraucht"
			+ "	FROM dd.zaubermaterial WHERE id=:id INTO :gegenstand, :anzahl, :wirdVerbraucht;";
	String ZAUBERMATERIAL_UPDATE = "UPDATE dd.zaubermaterial SET" //
			+ "	fk_gegenstand = :gegenstand, anzahl = :anzahl, wird_verbraucht = :wirdVerbraucht" //
			+ "	WHERE id = :id;";
}

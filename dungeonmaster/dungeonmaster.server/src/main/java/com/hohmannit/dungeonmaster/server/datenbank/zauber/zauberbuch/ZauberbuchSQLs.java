package com.hohmannit.dungeonmaster.server.datenbank.zauber.zauberbuch;

public interface ZauberbuchSQLs {
	String ZAUBER_PAGE_SELECT = "SELECT id, name, zeitaufwand, fk_zeitaufwand, reichweite, fk_reichweite, wirkungsdauer, fk_wirkungsdauer, beschreibung, hoeheregrade, grad, fk_schule"
			+ "	FROM dd.zauber;";

	String ZAUBER_PAGE_DATA_SELECT_INTO = " INTO :{page.id}, :{page.name}, :{page.zeitaufwand}, :{page.zeitaufwandtyp}, :{page.reichweite}, :{page.reichweitetyp}, :{page.wirkungsdauer}, :{page.wirkungsdauertyp}, :{page.beschreibung}, :{page.hoehereGrade}, :{page.grad}, :{page.schule}";

	String ZAUBER_INSERT = "INSERT INTO dd.zauber ("//
			+ "name, " //
			+ "zeitaufwand, " //
			+ "fk_zeitaufwand, " //
			+ "reichweite, " //
			+ "fk_reichweite, " //
			+ "wirkungsdauer, " //
			+ "fk_wirkungsdauer, " //
			+ "beschreibung, " //
			+ "hoeheregrade, " //
			+ "grad, " //
			+ "fk_schule) " //
			+ "VALUES (" //
			+ ":name,:zeitaufwand,:zeitaufwandtyp,:reichweite,:reichweitetyp,:wirkungsdauer,:wirkungsdauertyp,:beschreibung,:hoeheregrade,:grad,:schule)";

	String ZAUBER_SELECT = ""//
			+ "SELECT " //
			+ "name, "//
			+ "zeitaufwand, "//
			+ "fk_zeitaufwand, "//
			+ "reichweite, "//
			+ "fk_reichweite, "//
			+ "wirkungsdauer, "//
			+ "fk_wirkungsdauer, "//
			+ "beschreibung, "//
			+ "hoeheregrade, "//
			+ "grad, "//
			+ "fk_schule, "//
			+ "verbal, "//
			+ "gestik, "//
			+ "material, "//
			+ "ritual,"//
			+ "konzentration"//
			+ "	FROM dd.zauber "//
			+ "WHERE    id = :id "//
			+ "INTO     :name, "//
			+ "         :zeitaufwand, "//
			+ "         :zeitaufwandtyp, "//
			+ "         :reichweite, "//
			+ "         :reichweitetyp, "//
			+ "         :wirkungsdauer, "//
			+ "         :wirkungsdauertyp, "//
			+ "         :beschreibung, "//
			+ "         :hoeheregrade, "//
			+ "         :grad, "//
			+ "         :schule, "//
			+ "         :verbal, "//
			+ "         :gestik, "//
			+ "         :material, "//
			+ "         :ritual," //
			+ "         :konzentration";

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

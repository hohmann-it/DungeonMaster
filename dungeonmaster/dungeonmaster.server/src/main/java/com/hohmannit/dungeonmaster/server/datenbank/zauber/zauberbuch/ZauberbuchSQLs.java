package com.hohmannit.dungeonmaster.server.datenbank.zauber.zauberbuch;

public interface ZauberbuchSQLs {
	String ZAUBER_PAGE_SELECT = "SELECT zauber_id, name, zeitaufwand, fk_zeitaufwand_typ, reichweite, fk_reichweite, wirkungsdauer, fk_wirkungsdauer_typ, beschreibung, hoehere_grade, grad, fk_schule"
			+ "	FROM dd.zauber;";

	String ZAUBER_PAGE_DATA_SELECT_INTO = " INTO :{page.zauberId}, :{page.name}, :{page.zeitaufwand}, :{page.zeitaufwandtyp}, :{page.reichweite}, :{page.reichweitetyp}, :{page.wirkungsdauer}, :{page.wirkungsdauertyp}, :{page.beschreibung}, :{page.hoehereGrade}, :{page.grad}, :{page.schule}";

	String ZAUBER_INSERT = "INSERT INTO dd.zauber ("//
			+ "name, " //
			+ "zeitaufwand, " //
			+ "fk_zeitaufwand_typ, " //
			+ "reichweite, " //
			+ "fk_reichweite, " //
			+ "wirkungsdauer, " //
			+ "fk_wirkungsdauer_typ, " //
			+ "beschreibung, " //
			+ "hoehere_grade, " //
			+ "grad, " //
			+ "fk_schule) " //
			+ "VALUES (" //
			+ ":name,:zeitaufwand,:zeitaufwandtyp,:reichweite,:reichweitetyp,:wirkungsdauer,:wirkungsdauertyp,:beschreibung,:hoeheregrade,:grad,:schule)";

	String ZAUBER_SELECT = ""//
			+ "SELECT " //
			+ "name, "//
			+ "zeitaufwand, "//
			+ "fk_zeitaufwand_typ, "//
			+ "reichweite, "//
			+ "fk_reichweite, "//
			+ "wirkungsdauer, "//
			+ "fk_wirkungsdauer_typ, "//
			+ "beschreibung, "//
			+ "hoehere_grade, "//
			+ "grad, "//
			+ "fk_schule, "//
			+ "verbal, "//
			+ "gestik, "//
			+ "material, "//
			+ "ritual"//
			+ "	FROM dd.zauber "//
			+ "WHERE    zauber_id = :zauberId "//
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
			+ "         :ritual";

	String ZAUBERMATERIAL_SELECT = "" //
			+ "SELECT" //
			+ "				zm.zaubermaterial_id, " //
			+ "				zm.fk_gegenstand, " //
			+ "				zm.fk_ersatz, " //
			+ "				g.wert, " //
			+ "				zm.anzahl, " //
			+ "				g.gewicht " //
			+ "FROM         dd.zaubermaterial zm INNER JOIN dd.gegenstand g ON zm.fk_gegenstand = g.gegenstand_id WHERE fk_zauber = :zauberId " //
			+ "INTO         :{ZaubkomponentenTable.id}," //
			+ "				:{ZaubkomponentenTable.name}," //
			+ "				:{ZaubkomponentenTable.ersatz}," //
			+ "				:{ZaubkomponentenTable.wert},"//
			+ "				:{ZaubkomponentenTable.anzahl},"//
			+ "				:{ZaubkomponentenTable.gewicht}";
}

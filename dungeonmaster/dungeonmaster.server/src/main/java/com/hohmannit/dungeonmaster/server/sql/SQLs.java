/*
 * Copyright (c) 2021 BSI Business Systems Integration AG.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Distribution License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/org/documents/edl-v10.html
 *
 * Contributors:
 *     BSI Business Systems Integration AG - initial API and implementation
 */
package com.hohmannit.dungeonmaster.server.sql;

public interface SQLs {
	String CHARAKTERE_PAGE_SELECT = "SELECT charakter_id, klasse, name" + "	FROM od.charaktere;";
	String CHARAKTERE_PAGE_DATA_SELECT_INTO = " INTO :{page.charakterId}, :{page.klasse}, :{page.name}";

	String ZAUBER_PAGE_SELECT = "SELECT zauber_id, name, zeitaufwand, fk_zeitaufwand_typ, reichweite, fk_reichweite_typ, wirkungsdauer, fk_wirkungsdauer_typ, beschreibung, hoehere_grade, grad, fk_zauber_typ"
			+ "	FROM dd.zauber;";

	String ZAUBER_PAGE_DATA_SELECT_INTO = " INTO :{page.zauberId}, :{page.name}, :{page.zeitaufwand}, :{page.zeitaufwandtyp}, :{page.reichweite}, :{page.reichweitetyp}, :{page.wirkungsdauer}, :{page.wirkungsdauertyp}, :{page.beschreibung}, :{page.hoehereGrade}, :{page.grad}, :{page.zaubertyp}";

	String ZEITAUFWANDTYP_LOOKUP = "SELECT zeitaufwandtyp_id, typ FROM dd.zeitaufwandtyp WHERE 1 = 1 "
			+ "<key>    AND zeitaufwandtyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String REICHWEITETYP_LOOKUP = "SELECT reichweitetyp_id, typ_lang FROM dd.reichweitetyp WHERE 1 = 1 "
			+ "<key>    AND reichweitetyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ_lang) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String WIRKUNGSDAUERTYP_LOOKUP = "SELECT wirkungsdauertyp_id, typ FROM dd.wirkungsdauertyp WHERE 1 = 1 "
			+ "<key>    AND wirkungsdauertyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String ZAUBERTYP_LOOKUP = "SELECT zaubertyp_id, typ FROM dd.zaubertyp WHERE 1 = 1 "
			+ "<key>    AND zaubertyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String ZAUBERMATERIAL_LOOKUP = "SELECT gegenstand_id, name FROM dd.gegenstand WHERE 1 = 1 "
			+ "<key>    AND gegenstand_id = :key </key> " //
			+ "<text>   AND UPPER(name) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String ZAUBER_INSERT = "INSERT INTO dd.zauber ("//
			+ "name, " //
			+ "zeitaufwand, " //
			+ "fk_zeitaufwand_typ, " //
			+ "reichweite, " //
			+ "fk_reichweite_typ, " //
			+ "wirkungsdauer, " //
			+ "fk_wirkungsdauer_typ, " //
			+ "beschreibung, " //
			+ "hoehere_grade, " //
			+ "grad, " //
			+ "fk_zauber_typ) " //
			+ "VALUES (" //
			+ ":name,:zeitaufwand,:zeitaufwandtyp,:reichweite,:reichweitetyp,:wirkungsdauer,:wirkungsdauertyp,:beschreibung,:hoeheregrade,:grad,:zaubertyp)";

	String ZAUBER_SELECT = ""//
			+ "SELECT " //
			+ "name, "//
			+ "zeitaufwand, "//
			+ "fk_zeitaufwand_typ, "//
			+ "reichweite, "//
			+ "fk_reichweite_typ, "//
			+ "wirkungsdauer, "//
			+ "fk_wirkungsdauer_typ, "//
			+ "beschreibung, "//
			+ "hoehere_grade, "//
			+ "grad, "//
			+ "fk_zauber_typ, "//
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
			+ "         :zaubertyp, "//
			+ "         :verbal, "//
			+ "         :gestik, "//
			+ "         :material, "//
			+ "         :ritual";

	String ZAUBERMATERIAL_SELECT = "" //
			+ "SELECT" //
			+ "				zaubermaterial_id, " //
			+ "				fk_gegenstand " //
			+ "FROM         dd.zaubermaterial WHERE fk_zauber = :zauberId" //
			+ "INTO         :{ZaubkomponentenTable.id}," //
			+ "				:{ZaubkomponentenTable.name}";

}

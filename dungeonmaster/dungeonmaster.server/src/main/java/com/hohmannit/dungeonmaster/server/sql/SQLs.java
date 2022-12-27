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
	String CHARAKTERE_PAGE_SELECT = "SELECT charakter_id, klasse, name" + "	FROM public.charaktere;";
	String CHARAKTERE_PAGE_DATA_SELECT_INTO = " INTO :{page.charakterId}, :{page.klasse}, :{page.name}";

	String ZAUBERBUCH_PAGE_SELECT = "SELECT zauber_id, name, zeitaufwand, fk_zeitaufwand_typ, reichweite, fk_reichweite_typ, wirkungsdauer, fk_wirkungsdauer_typ, beschreibung, hoehere_grade, grad, fk_zauber_typ"
			+ "	FROM public.zauber;";

	String ZAUBERBUCH_PAGE_DATA_SELECT_INTO = " INTO :{page.zauberId}, :{page.name}, :{page.zeitaufwand}, :{page.zeitaufwandtyp}, :{page.reichweite}, :{page.reichweitetyp}, :{page.wirkungsdauer}, :{page.wirkungsdauertyp}, :{page.beschreibung}, :{page.hoehereGrade}, :{page.grad}, :{page.zaubertyp}";

	String ZAUBERTYP_LOOKUP = "SELECT zaubertyp_id, typ FROM public.zaubertyp WHERE 1 = 1 "
			+ "<key>    AND zaubertyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String ZEITAUFWAND_LOOKUP = "SELECT zeitaufwandtyp_id, typ FROM public.zeitaufwandtyp WHERE 1 = 1 "
			+ "<key>    AND zeitaufwandtyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String REICHWEITE_LOOKUP = "SELECT reichweitetyp_id, typ_lang FROM public.reichweitetyp WHERE 1 = 1 "
			+ "<key>    AND reichweitetyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ_lang) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";

	String WIRKUNGSDAUER_LOOKUP = "SELECT wirkungsdauertyp_id, typ FROM public.wirkungsdauertyp WHERE 1 = 1 "
			+ "<key>    AND wirkungsdauertyp_id = :key </key> " //
			+ "<text>   AND UPPER(typ) LIKE UPPER(:text||'%') </text> " //
			+ "<all></all>";
}

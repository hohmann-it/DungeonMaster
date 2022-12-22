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
	String CHARAKTERE_PAGE_SELECT = "SELECT charakter_id, name, klasse FROM charaktere";
	String CHARAKTERE_PAGE_DATA_SELECT_INTO = " INTO :{page.charakterId}, :{page.name}, :{page.klasse}";

	String ZAUBERBUCH_PAGE_SELECT = "SELECT zauber_id, name, zeitaufwand, zeitaufwand_typ, "
			+ "reichweite, reichweite_typ, wirkungsdauer, wirkungsdauer_typ, beschreibung, hoehere_grade FROM zauber;";

	String ZAUBERBUCH_PAGE_DATA_SELECT_INTO = "INTO :{page.zauberId}, :{page.name}, :{page.zeitaufwand}";
}

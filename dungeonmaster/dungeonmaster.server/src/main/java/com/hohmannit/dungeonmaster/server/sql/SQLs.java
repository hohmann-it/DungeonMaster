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

//tag::createDB[]
//tag::organizationListing[]
public interface SQLs {
	// end::organizationListing[]
	String CHARACTERS_PAGE_SELECT = "SELECT character_id, name, class FROM Characters";

	String CHARACTERS_PAGE_DATA_SELECT_INTO = " INTO :{page.characterId}, :{page.name}, :{page.class}";
}

/*
 * Copyright (c) 2020 BSI Business Systems Integration AG.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Distribution License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/org/documents/edl-v10.html
 *
 * Contributors:
 *     BSI Business Systems Integration AG - initial API and implementation
 */
package com.hohmannit.dungeonmaster.server.sql;

import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.config.CONFIG;
import org.eclipse.scout.rt.server.jdbc.postgresql.AbstractPostgreSqlService;

import com.hohmannit.dungeonmaster.server.sql.DatabaseProperties.JdbcMappingNameProperty;

@Order(1950)
// tag::service[]
public class PostgresSqlService extends AbstractPostgreSqlService {

	@Override
	protected String getConfiguredJdbcMappingName() {
		return CONFIG.getPropertyValue(JdbcMappingNameProperty.class);
	}

	@Override
	protected String getConfiguredUsername() {
		return "dungeonmaster";
	}

	@Override
	protected String getConfiguredPassword() {
		return System.getenv("PGPASSWORD");
	}
}
// end::service[]

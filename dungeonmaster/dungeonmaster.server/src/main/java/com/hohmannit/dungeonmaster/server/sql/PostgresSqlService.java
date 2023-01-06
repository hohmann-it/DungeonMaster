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
import org.eclipse.scout.rt.platform.exception.PlatformException;
import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.server.jdbc.postgresql.AbstractPostgreSqlService;

import com.hohmannit.dungeonmaster.server.Exceptional;
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

	/**
	 * This override wraps the super call into a try block to catch any exceptions.
	 * They are then handled by {@link Exceptional} to be displayed as
	 * {@link VetoException} to the user. We use this e. g. for unique constraints
	 * so that the user does not enter the same data twice.
	 */
	@Override
	public int delete(String s, Object... bindBases) {
		try {
			return super.delete(s, bindBases);
		} catch (PlatformException e) {
			Exceptional.handle(e);
		}
		return super.delete(s, bindBases);
	}

	/**
	 * This override wraps the super call into a try block to catch any exceptions.
	 * They are then handled by {@link Exceptional} to be displayed as
	 * {@link VetoException} to the user. We use this e. g. for unique constraints
	 * so that the user does not enter the same data twice.
	 */
	@Override
	public int insert(String s, Object... bindBases) {
		try {
			return super.insert(s, bindBases);
		} catch (PlatformException e) {
			Exceptional.handle(e);
		}
		return super.insert(s, bindBases);
	}

	/**
	 * This override wraps the super call into a try block to catch any exceptions.
	 * They are then handled by {@link Exceptional} to be displayed as
	 * {@link VetoException} to the user. We use this e. g. for unique constraints
	 * so that the user does not enter the same data twice.
	 */
	@Override
	public int update(String s, Object... bindBases) {
		try {
			return super.update(s, bindBases);
		} catch (PlatformException e) {
			Exceptional.handle(e);
		}
		return super.update(s, bindBases);
	}
}

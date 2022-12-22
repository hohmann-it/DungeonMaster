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

import javax.annotation.PostConstruct;

import org.eclipse.scout.rt.platform.ApplicationScoped;
import org.eclipse.scout.rt.platform.CreateImmediately;
import org.eclipse.scout.rt.platform.config.CONFIG;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hohmannit.dungeonmaster.server.sql.DatabaseProperties.DatabaseAutoCreateProperty;

// tag::service[]
@ApplicationScoped
@CreateImmediately
public class DatabaseSetupService implements IDataStoreService {
	private static final Logger LOG = LoggerFactory.getLogger(DatabaseSetupService.class);

	@PostConstruct
	public void autoCreateDatabase() {
		if (CONFIG.getPropertyValue(DatabaseAutoCreateProperty.class)) {
//			Create database here if needed 
//			try {
//				BEANS.get(PostgresSqlService.class).createDB();
//				RunContext context = BEANS.get(SuperUserRunContextProducer.class).produce();
//				IRunnable runnable = () -> {
//					createOrganizationTable();
//					createPersonTable();
//				};
//
//				context.run(runnable);
//			} catch (RuntimeException e) {
//				BEANS.get(ExceptionHandler.class).handle(e);
//			}
		}
	}

	@Override
	public void dropDataStore() {
//		SQL.update(SQLs.PERSON_DROP_TABLE);
//		SQL.update(SQLs.ORGANIZATION_DROP_TABLE);
	}

	@Override
	public void createDataStore() {
//		createOrganizationTable();
//		createPersonTable();
	}
	// tag::service[]
}
// end::service[]

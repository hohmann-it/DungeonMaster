package com.hohmannit.dungeonmaster.server.datenbank.zauber.schule;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.schule.ISchuleLookupService;

public class SchuleLookupService extends AbstractSqlLookupService<Long> implements ISchuleLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return SchuleSQLs.SCHULE_LOOKUP;
	}
}

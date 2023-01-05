package com.hohmannit.dungeonmaster.server.datenbank.zauber.wirkungsdauer;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.IWirkungsdauerLookupService;

public class WirkungsdauerLookupService extends AbstractSqlLookupService<Long> implements IWirkungsdauerLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return WirkungsdauerSQLs.WIRKUNGSDAUER_LOOKUP;
	}
}

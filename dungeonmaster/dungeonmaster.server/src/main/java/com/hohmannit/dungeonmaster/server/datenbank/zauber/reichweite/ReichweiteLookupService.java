package com.hohmannit.dungeonmaster.server.datenbank.zauber.reichweite;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.IReichweiteLookupService;

public class ReichweiteLookupService extends AbstractSqlLookupService<Long> implements IReichweiteLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return ReichweiteSQLs.REICHWEITETYP_LOOKUP;
	}
}

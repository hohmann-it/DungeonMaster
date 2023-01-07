package com.hohmannit.dungeonmaster.server.datenbank.zauber.zeitaufwand;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.IZeitaufwandLookupService;

public class ZeitaufwandLookupService extends AbstractSqlLookupService<Long> implements IZeitaufwandLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return ZeitaufwandSQLs.ZEITAUFWAND_LOOKUP;
	}
}

package com.hohmannit.dungeonmaster.server.datenbank.zauber.zaubertyp;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp.IZaubertypLookupService;

public class ZaubertypLookupService extends AbstractSqlLookupService<Long> implements IZaubertypLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return ZaubertypSQLs.ZAUBERTYP_LOOKUP;
	}
}

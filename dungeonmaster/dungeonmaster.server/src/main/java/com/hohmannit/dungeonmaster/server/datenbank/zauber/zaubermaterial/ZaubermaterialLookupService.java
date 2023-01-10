package com.hohmannit.dungeonmaster.server.datenbank.zauber.zaubermaterial;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.material.IGegenstandLookupService;

public class ZaubermaterialLookupService extends AbstractSqlLookupService<Long> implements IGegenstandLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return ZaubermaterialSQLs.ZAUBERMATERIAL_LOOKUP;
	}
}

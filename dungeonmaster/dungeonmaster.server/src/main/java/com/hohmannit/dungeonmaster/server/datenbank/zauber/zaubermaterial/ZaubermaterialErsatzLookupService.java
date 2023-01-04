package com.hohmannit.dungeonmaster.server.datenbank.zauber.zaubermaterial;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.material.IZaubermaterialErsatzLookupService;

public class ZaubermaterialErsatzLookupService extends AbstractSqlLookupService<Long>
		implements IZaubermaterialErsatzLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return ZaubermaterialSQLs.ZAUBERMATERIAL_ERSATZ_LOOKUP;
	}
}

package com.hohmannit.dungeonmaster.server.zauberbuch.material;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.material.IZaubermaterialErsatzLookupService;

public class ZaubermaterialErsatzLookupService extends AbstractSqlLookupService<Long>
		implements IZaubermaterialErsatzLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return SQLs.ZAUBERMATERIAL_ERSATZ_LOOKUP;
	}
}

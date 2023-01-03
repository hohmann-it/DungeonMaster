package com.hohmannit.dungeonmaster.server.zauberbuch.material;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.material.IMaterialLookupService;

public class MaterialLookupService extends AbstractSqlLookupService<Long> implements IMaterialLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return SQLs.ZAUBERMATERIAL_LOOKUP;
	}
}

package com.hohmannit.dungeonmaster.server.zauberbuch.typ;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.typ.IZaubertypLookupService;

public class ZaubertypLookupService extends AbstractSqlLookupService<Long> implements IZaubertypLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return SQLs.ZAUBERTYP_LOOKUP;
	}
}

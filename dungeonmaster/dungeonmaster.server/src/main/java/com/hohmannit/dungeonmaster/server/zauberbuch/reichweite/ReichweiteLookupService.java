package com.hohmannit.dungeonmaster.server.zauberbuch.reichweite;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.reichweite.IReichweiteLookupService;

public class ReichweiteLookupService extends AbstractSqlLookupService<Long> implements IReichweiteLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return SQLs.REICHWEITETYP_LOOKUP;
	}
}

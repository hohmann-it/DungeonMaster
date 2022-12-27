package com.hohmannit.dungeonmaster.server.zauberbuch.wirkungsdauer;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.wirkungsdauer.IWirkungsdauerLookupService;

public class WirkungsdauerLookupService extends AbstractSqlLookupService<Long> implements IWirkungsdauerLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return SQLs.WIRKUNGSDAUER_LOOKUP;
	}
}

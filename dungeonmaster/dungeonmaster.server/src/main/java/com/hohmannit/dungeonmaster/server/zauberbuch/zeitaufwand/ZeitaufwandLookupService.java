package com.hohmannit.dungeonmaster.server.zauberbuch.zeitaufwand;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.zeitaufwand.IZeitaufwandLookupService;

public class ZeitaufwandLookupService extends AbstractSqlLookupService<Long> implements IZeitaufwandLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return SQLs.ZEITAUFWAND_LOOKUP;
	}
}

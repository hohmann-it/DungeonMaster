package com.hohmannit.dungeonmaster.server.zauberbuch.komponente;

import org.eclipse.scout.rt.server.jdbc.lookup.AbstractSqlLookupService;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.komponente.IZauberkomponenteLookupService;

public class ZauberkomponenteLookupService extends AbstractSqlLookupService<Long>
		implements IZauberkomponenteLookupService {
	@Override
	protected String getConfiguredSqlSelect() {
		return SQLs.KOMPONENTE_LOOKUP;
	}

}

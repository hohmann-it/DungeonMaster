package com.hohmannit.dungeonmaster.shared.datenbank.zauber.material;

import org.eclipse.scout.rt.shared.services.lookup.ILookupService;
import org.eclipse.scout.rt.shared.services.lookup.LookupCall;

public class GegenstandLookupCall extends LookupCall<Long> {
	private static final long serialVersionUID = 1L;

	@Override
	protected Class<? extends ILookupService<Long>> getConfiguredService() {
		return IGegenstandLookupService.class;
	}
}

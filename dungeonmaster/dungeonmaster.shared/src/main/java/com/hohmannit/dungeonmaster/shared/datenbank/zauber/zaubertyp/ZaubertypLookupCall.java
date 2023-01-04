package com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp;

import org.eclipse.scout.rt.shared.services.lookup.ILookupService;
import org.eclipse.scout.rt.shared.services.lookup.LookupCall;

public class ZaubertypLookupCall extends LookupCall<Long> {
	private static final long serialVersionUID = 1L;

	@Override
	protected Class<? extends ILookupService<Long>> getConfiguredService() {
		return IZaubertypLookupService.class;
	}
}
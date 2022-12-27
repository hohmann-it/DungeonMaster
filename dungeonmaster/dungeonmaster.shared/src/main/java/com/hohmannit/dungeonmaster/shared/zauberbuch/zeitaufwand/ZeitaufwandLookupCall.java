package com.hohmannit.dungeonmaster.shared.zauberbuch.zeitaufwand;

import org.eclipse.scout.rt.shared.services.lookup.ILookupService;
import org.eclipse.scout.rt.shared.services.lookup.LookupCall;

public class ZeitaufwandLookupCall extends LookupCall<Long> {
	private static final long serialVersionUID = 1L;

	@Override
	protected Class<? extends ILookupService<Long>> getConfiguredService() {
		return IZeitaufwandLookupService.class;
	}
}

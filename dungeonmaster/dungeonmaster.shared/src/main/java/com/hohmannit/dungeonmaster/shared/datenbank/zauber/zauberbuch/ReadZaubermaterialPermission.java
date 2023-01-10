package com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch;

import org.eclipse.scout.rt.security.AbstractPermission;

public class ReadZaubermaterialPermission extends AbstractPermission {
	private static final long serialVersionUID = 1L;

	public ReadZaubermaterialPermission() {
		super("ReadZaubermaterialPermission");
	}
}

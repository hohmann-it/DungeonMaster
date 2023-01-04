package com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch;

import java.security.Permission;

import org.eclipse.scout.rt.security.AbstractPermission;
import org.eclipse.scout.rt.security.IPermission;

public class ReadZauberbuchPermission extends AbstractPermission {
	private static final long serialVersionUID = 1L;

	public ReadZauberbuchPermission() {
		super("ReadZauberPermission");
	}

	@Override
	public boolean matches(IPermission p) {
		return true;
	}

	@Override
	public boolean implies(Permission permission) {
		return true;
	}
}

package com.hohmannit.dungeonmaster.shared.zauberbuch;

import java.security.Permission;

import org.eclipse.scout.rt.security.AbstractPermission;
import org.eclipse.scout.rt.security.IPermission;

public class ReadZauberPermission extends AbstractPermission {
	private static final long serialVersionUID = 1L;

	public ReadZauberPermission() {
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

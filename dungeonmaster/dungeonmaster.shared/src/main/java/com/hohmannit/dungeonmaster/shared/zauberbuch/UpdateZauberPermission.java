package com.hohmannit.dungeonmaster.shared.zauberbuch;

import java.security.Permission;

import org.eclipse.scout.rt.security.AbstractPermission;

public class UpdateZauberPermission extends AbstractPermission {
	private static final long serialVersionUID = 1L;

	public UpdateZauberPermission() {
		super("UpdateZauberPermission");
	}

	@Override
	public boolean implies(Permission permission) {
		return true;
	}
}

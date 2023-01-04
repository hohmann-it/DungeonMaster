package com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch;

import java.security.Permission;

import org.eclipse.scout.rt.security.AbstractPermission;

public class UpdateZauberbuchPermission extends AbstractPermission {
	private static final long serialVersionUID = 1L;

	public UpdateZauberbuchPermission() {
		super("UpdateZauberPermission");
	}

	@Override
	public boolean implies(Permission permission) {
		return true;
	}
}

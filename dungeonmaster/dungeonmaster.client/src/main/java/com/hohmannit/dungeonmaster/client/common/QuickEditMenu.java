package com.hohmannit.dungeonmaster.client.common;

import org.eclipse.scout.rt.client.ui.action.menu.AbstractMenu;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.shared.Icons;

public class QuickEditMenu extends AbstractMenu {
	@Override
	protected String getConfiguredText() {
		return TEXTS.get("Allgemein_Bearbeiten");
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Gear;
	}
}

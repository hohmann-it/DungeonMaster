package com.hohmannit.dungeonmaster.client.settings;

import org.eclipse.scout.rt.client.ui.desktop.outline.AbstractOutline;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.shared.Icons;

/**
 * @author phohm
 */
@Order(3000)
public class SettingsOutline extends AbstractOutline {

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Settings");
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Gear;
	}
}

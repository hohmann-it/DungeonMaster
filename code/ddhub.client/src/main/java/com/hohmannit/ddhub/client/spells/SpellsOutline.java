package com.hohmannit.ddhub.client.spells;

import java.util.List;

import org.eclipse.scout.rt.client.ui.desktop.outline.AbstractOutline;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.IPage;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.ddhub.shared.Icons;

@Order(1000)
public class SpellsOutline extends AbstractOutline {

	@Override
	protected void execCreateChildPages(List<IPage<?>> pageList) {
		super.execCreateChildPages(pageList);
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Spells");
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.ExclamationMarkCircle;
	}
}

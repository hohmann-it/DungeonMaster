package com.hohmannit.dungeonmaster.client.zauberbuch;

import java.util.List;

import org.eclipse.scout.rt.client.ui.desktop.outline.pages.AbstractPageWithNodes;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.IPage;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.shared.Icons;

public class ZauberNodePage extends AbstractPageWithNodes {
	@Override
	protected void execCreateChildPages(List<IPage<?>> pageList) {
		pageList.add(new ZauberbuchTablePage());
		pageList.add(new ZaubertypTablePage());
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zauber");
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Spell;
	}

	@Override
	protected String getConfiguredOverviewIconId() {
		return Icons.Spell;
	}
}
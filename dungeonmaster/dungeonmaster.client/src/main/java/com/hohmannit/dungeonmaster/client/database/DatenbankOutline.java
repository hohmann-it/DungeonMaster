package com.hohmannit.dungeonmaster.client.database;

import java.util.List;

import org.eclipse.scout.rt.client.ui.desktop.outline.AbstractOutline;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.IPage;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.client.charakter.CharakterTablePage;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberNodePage;
import com.hohmannit.dungeonmaster.shared.Icons;

@Order(1000)
public class DatenbankOutline extends AbstractOutline {

	@Override
	protected void execCreateChildPages(List<IPage<?>> pageList) {
		super.execCreateChildPages(pageList);
		pageList.add(new CharakterTablePage());
		pageList.add(new ZauberNodePage());
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Outline_Datenbank_Titel");
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Database;
	}
}

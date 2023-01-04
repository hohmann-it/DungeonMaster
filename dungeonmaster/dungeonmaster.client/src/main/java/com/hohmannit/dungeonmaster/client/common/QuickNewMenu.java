package com.hohmannit.dungeonmaster.client.common;

import java.util.Set;

import org.eclipse.scout.rt.client.ui.action.menu.AbstractMenu;
import org.eclipse.scout.rt.client.ui.action.menu.IMenuType;
import org.eclipse.scout.rt.client.ui.action.menu.TableMenuType;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.platform.util.CollectionUtility;

import com.hohmannit.dungeonmaster.shared.Icons;

public class QuickNewMenu extends AbstractMenu {
	@Override
	protected String getConfiguredText() {
		return TEXTS.get("New");
	}

	@Override
	protected Set<? extends IMenuType> getConfiguredMenuTypes() {
		return CollectionUtility.<IMenuType>hashSet(TableMenuType.EmptySpace, TableMenuType.SingleSelection);
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Plus;
	}
}

package com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer;

import org.eclipse.scout.rt.client.dto.Data;
import org.eclipse.scout.rt.client.ui.basic.table.AbstractTable;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.AbstractPageWithTable;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerTablePage.Table;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.IWirkungsdauerService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.WirkungsdauerTablePageData;

@Data(WirkungsdauerTablePageData.class)
public class WirkungsdauerTablePage extends AbstractPageWithTable<Table> {
	@Override
	protected boolean getConfiguredLeaf() {
		return true;
	}

	@Override
	protected void execLoadData(SearchFilter filter) {
		importPageData(BEANS.get(IWirkungsdauerService.class).getWirkungsdauerTableData(filter));
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Wirkungsdauer");
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Duration;
	}

	@Override
	protected String getConfiguredOverviewIconId() {
		return Icons.Duration;
	}

	public class Table extends AbstractTable {

	}
}

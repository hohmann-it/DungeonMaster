package com.hohmannit.dungeonmaster.client.spellbook;

import org.eclipse.scout.rt.client.dto.Data;
import org.eclipse.scout.rt.client.ui.basic.table.AbstractTable;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.AbstractPageWithTable;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.client.spellbook.SpellbookTablePage.Table;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.spellbook.ISpellbookService;
import com.hohmannit.dungeonmaster.shared.spellbook.SpellbookTablePageData;

@Data(SpellbookTablePageData.class)
public class SpellbookTablePage extends AbstractPageWithTable<Table> {
	@Override
	protected boolean getConfiguredLeaf() {
		return true;
	}

	@Override
	protected void execLoadData(SearchFilter filter) {
		importPageData(BEANS.get(ISpellbookService.class).getSpellbookTableData(filter));
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Spellbook;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Spellbook");
	}

	public class Table extends AbstractTable {

	}
}

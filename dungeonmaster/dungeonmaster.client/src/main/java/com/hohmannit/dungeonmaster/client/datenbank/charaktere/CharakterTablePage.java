package com.hohmannit.dungeonmaster.client.datenbank.charaktere;

import org.eclipse.scout.rt.client.dto.Data;
import org.eclipse.scout.rt.client.ui.basic.table.AbstractTable;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractStringColumn;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.AbstractPageWithTable;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.client.datenbank.charaktere.CharakterTablePage.Table;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.character.CharakterTablePageData;
import com.hohmannit.dungeonmaster.shared.datenbank.charaktere.ICharaktereService;

@Data(CharakterTablePageData.class)
public class CharakterTablePage extends AbstractPageWithTable<Table> {
	@Override
	protected boolean getConfiguredLeaf() {
		return true;
	}

	@Override
	protected void execLoadData(SearchFilter filter) {
		importPageData(BEANS.get(ICharaktereService.class).getCharakterTableData(filter));
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.DwarfHelmet;
	}

	@Override
	protected String getConfiguredOverviewIconId() {
		return Icons.DwarfHelmet;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Page_Charaktere_Titel");
	}

	public class Table extends AbstractTable {

		public NameColumn getNameColumn() {
			return getColumnSet().getColumnByClass(NameColumn.class);
		}

		public KlasseColumn getKlasseColumn() {
			return getColumnSet().getColumnByClass(KlasseColumn.class);
		}

		public CharakterIdColumn getCharakterIdColumn() {
			return getColumnSet().getColumnByClass(CharakterIdColumn.class);
		}

		@Order(1000)
		public class CharakterIdColumn extends AbstractStringColumn {

			@Override
			protected boolean getConfiguredDisplayable() {
				return false;
			}

			@Override
			protected boolean getConfiguredPrimaryKey() {
				return true;
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

		@Order(2000)
		public class KlasseColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Page_Charaktere_Klasse_Label");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

		@Order(3000)
		public class NameColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Name");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

	}
}

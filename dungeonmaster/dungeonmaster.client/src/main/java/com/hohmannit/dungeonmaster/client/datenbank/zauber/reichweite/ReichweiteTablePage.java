package com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite;

import org.eclipse.scout.rt.client.dto.Data;
import org.eclipse.scout.rt.client.ui.action.menu.IMenu;
import org.eclipse.scout.rt.client.ui.basic.table.AbstractTable;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractLongColumn;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractStringColumn;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.AbstractPageWithTable;
import org.eclipse.scout.rt.client.ui.form.FormEvent;
import org.eclipse.scout.rt.client.ui.form.FormListener;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.exception.ProcessingException;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.client.common.QuickDeleteMenu;
import com.hohmannit.dungeonmaster.client.common.QuickEditMenu;
import com.hohmannit.dungeonmaster.client.common.QuickNewMenu;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteTablePage.Table;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.IReichweiteService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.ReichweiteTablePageData;

@Data(ReichweiteTablePageData.class)
public class ReichweiteTablePage extends AbstractPageWithTable<Table> {
	@Override
	protected boolean getConfiguredLeaf() {
		return true;
	}

	@Override
	protected void execLoadData(SearchFilter filter) {
		importPageData(BEANS.get(IReichweiteService.class).getReichweiteTableData(filter));
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zauber_Reichweite_Label_Titel");
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.SpellDistance;
	}

	@Override
	protected String getConfiguredOverviewIconId() {
		return Icons.SpellDistance;
	}

	public class Table extends AbstractTable {
		@Override
		protected boolean getConfiguredAutoResizeColumns() {
			return true;
		}

		@Override
		protected Class<? extends IMenu> getConfiguredDefaultMenu() {
			return EditMenu.class;
		}

		public BeschreibungColumn getBeschreibungColumn() {
			return getColumnSet().getColumnByClass(BeschreibungColumn.class);
		}

		public KurzColumn getKurzColumn() {
			return getColumnSet().getColumnByClass(KurzColumn.class);
		}

		public LangColumn getLangColumn() {
			return getColumnSet().getColumnByClass(LangColumn.class);
		}

		public IdColumn getIdColumn() {
			return getColumnSet().getColumnByClass(IdColumn.class);
		}

		@Order(10)
		public class EditMenu extends QuickEditMenu {

			@Override
			protected void execAction() {
				ReichweiteForm form = new ReichweiteForm();
				form.setId(getIdColumn().getSelectedValue());
				form.addFormListener(new ReichweiteFormListener());
				form.startModify();
			}

		}

		@Order(20)
		public class NewMenu extends QuickNewMenu {

			@Override
			protected void execAction() {
				ReichweiteForm form = new ReichweiteForm();
				form.addFormListener(new ReichweiteFormListener());
				form.startNew();
			}
		}

		@Order(30)
		public class DeleteMenu extends QuickDeleteMenu {

			@Override
			protected void execAction() throws ProcessingException {
				BEANS.get(IReichweiteService.class).delete(getIdColumn().getSelectedValues());
				deleteRow(getSelectedRow());
			}
		}

		private class ReichweiteFormListener implements FormListener {

			@Override
			public void formChanged(FormEvent e) {
				// reload page to reflect new/changed data after saving any changes
				if (FormEvent.TYPE_CLOSED == e.getType() && e.getForm().isFormStored()) {
					reloadPage();
				}
			}
		}

		@Order(1000)
		public class IdColumn extends AbstractLongColumn {
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
		public class LangColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zauber_Reichweite_Label_EinheitLang");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

		@Order(3000)
		public class KurzColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zauber_Reichweite_Label_EinheitKurz");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

		@Order(4000)
		public class BeschreibungColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Allgemein_Beschreibung");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

	}
}

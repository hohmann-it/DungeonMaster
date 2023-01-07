package com.hohmannit.dungeonmaster.client.datenbank.zauber.schule;

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
import com.hohmannit.dungeonmaster.client.datenbank.zauber.schule.SchuleTablePage.Table;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.schule.ISchuleService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.SchuleTablePageData;

@Data(SchuleTablePageData.class)
public class SchuleTablePage extends AbstractPageWithTable<Table> {
	@Override
	protected boolean getConfiguredLeaf() {
		return true;
	}

	@Override
	protected void execLoadData(SearchFilter filter) {
		importPageData(BEANS.get(ISchuleService.class).getSchuleTableData(filter));
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zauber_Schulen_Label_Titel");
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.SpellCategory;
	}

	@Override
	protected String getConfiguredOverviewIconId() {
		return Icons.SpellCategory;
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

		@Order(10)
		public class EditMenu extends QuickEditMenu {

			@Override
			protected void execAction() {
				SchuleForm form = new SchuleForm();
				form.setId(getIdColumn().getSelectedValue());
				form.addFormListener(new SchuleFormListener());
				form.startModify();
			}

		}

		@Order(20)
		public class NewMenu extends QuickNewMenu {

			@Override
			protected void execAction() {
				SchuleForm form = new SchuleForm();
				form.addFormListener(new SchuleFormListener());
				form.startNew();
			}
		}

		@Order(30)
		public class DeleteMenu extends QuickDeleteMenu {

			@Override
			protected void execAction() throws ProcessingException {
				BEANS.get(ISchuleService.class).delete(getIdColumn().getSelectedValues());
				deleteRow(getSelectedRow());
			}
		}

		private class SchuleFormListener implements FormListener {

			@Override
			public void formChanged(FormEvent e) {
				// reload page to reflect new/changed data after saving any changes
				if (FormEvent.TYPE_CLOSED == e.getType() && e.getForm().isFormStored()) {
					reloadPage();
				}
			}
		}

		public KategorieColumn getKategorieColumn() {
			return getColumnSet().getColumnByClass(KategorieColumn.class);
		}

		public BeschreibungColumn getBeschreibungColumn() {
			return getColumnSet().getColumnByClass(BeschreibungColumn.class);
		}

		public NameColumn getTypColumn() {
			return getColumnSet().getColumnByClass(NameColumn.class);
		}

		public IdColumn getIdColumn() {
			return getColumnSet().getColumnByClass(IdColumn.class);
		}

		@Order(1000)
		public class IdColumn extends AbstractLongColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Allgemein_ID");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}

			@Override
			protected boolean getConfiguredPrimaryKey() {
				return true;
			}

			@Override
			protected boolean getConfiguredDisplayable() {
				return false;
			}
		}

		@Order(2000)
		public class NameColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Allgemein_Name");
			}

			@Override
			protected int getConfiguredWidth() {
				return 300;
			}
		}

		@Order(3000)
		public class BeschreibungColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Allgemein_Beschreibung");
			}

			@Override
			protected int getConfiguredWidth() {
				return 971;
			}
		}

		@Order(4000)
		public class KategorieColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zauber_Schulen_Label_Kategorie");
			}

			@Override
			protected int getConfiguredWidth() {
				return 300;
			}

			@Override
			protected boolean getConfiguredVisible() {
				return false;
			}
		}

	}
}

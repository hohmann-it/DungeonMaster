package com.hohmannit.dungeonmaster.client.zauberbuch;

import java.util.Set;

import org.eclipse.scout.rt.client.dto.Data;
import org.eclipse.scout.rt.client.ui.action.menu.AbstractMenu;
import org.eclipse.scout.rt.client.ui.action.menu.IMenu;
import org.eclipse.scout.rt.client.ui.action.menu.IMenuType;
import org.eclipse.scout.rt.client.ui.action.menu.TableMenuType;
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
import org.eclipse.scout.rt.platform.util.CollectionUtility;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.client.zauberbuch.ZaubertypTablePage.Table;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZaubertypService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZaubertypTablePageData;

@Data(ZaubertypTablePageData.class)
public class ZaubertypTablePage extends AbstractPageWithTable<Table> {
	@Override
	protected boolean getConfiguredLeaf() {
		return true;
	}

	@Override
	protected void execLoadData(SearchFilter filter) {
		importPageData(BEANS.get(IZaubertypService.class).getZaubertypTableData(filter));
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zaubertypen");
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
		protected Class<? extends IMenu> getConfiguredDefaultMenu() {
			return EditMenu.class;
		}

		@Order(10)
		public class EditMenu extends AbstractMenu {
			@Override
			protected String getConfiguredText() {
				return TEXTS.get("Bearbeiten");
			}

			@Override
			protected void execAction() {
				ZaubertypForm form = new ZaubertypForm();
				form.setZaubertypId(getIdColumn().getSelectedValue());
				form.addFormListener(new ZaubertypFormListener());
				form.startModify();
			}
		}

		@Order(20)
		public class NewMenu extends AbstractMenu {

			@Override
			protected String getConfiguredText() {
				return TEXTS.get("New");
			}

			@Override
			protected Set<? extends IMenuType> getConfiguredMenuTypes() {
				return CollectionUtility.<IMenuType>hashSet(TableMenuType.EmptySpace, TableMenuType.SingleSelection);
			}

			@Override
			protected void execAction() {
				ZaubertypForm form = new ZaubertypForm();
				form.addFormListener(new ZaubertypFormListener());
				form.startNew();
			}
		}

		@Order(30)
		public class DeleteMenu extends AbstractMenu {

			@Override
			protected String getConfiguredText() {
				return TEXTS.get("DeleteMenu");
			}

			@Override
			protected Set<? extends IMenuType> getConfiguredMenuTypes() {
				return CollectionUtility.<IMenuType>hashSet(TableMenuType.SingleSelection,
						TableMenuType.MultiSelection);
			}

			@Override
			protected void execAction() throws ProcessingException {
				BEANS.get(IZaubertypService.class).delete(getIdColumn().getSelectedValues());
				deleteRow(getSelectedRow());
			}
		}

		private class ZaubertypFormListener implements FormListener {

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

		public TypColumn getTypColumn() {
			return getColumnSet().getColumnByClass(TypColumn.class);
		}

		public IdColumn getIdColumn() {
			return getColumnSet().getColumnByClass(IdColumn.class);
		}

		@Order(1000)
		public class IdColumn extends AbstractLongColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("ID");
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
		public class TypColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zaubertyp");
			}

			@Override
			protected int getConfiguredWidth() {
				return 300;
			}
		}

		@Order(3000)
		public class KategorieColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Kategorie");
			}

			@Override
			protected int getConfiguredWidth() {
				return 300;
			}
		}

	}
}

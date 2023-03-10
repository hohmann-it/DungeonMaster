package com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch;

import org.eclipse.scout.rt.client.dto.Data;
import org.eclipse.scout.rt.client.ui.action.menu.IMenu;
import org.eclipse.scout.rt.client.ui.basic.table.AbstractTable;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractLongColumn;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractSmartColumn;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractStringColumn;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.AbstractPageWithTable;
import org.eclipse.scout.rt.client.ui.form.FormEvent;
import org.eclipse.scout.rt.client.ui.form.FormListener;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.code.ICodeType;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;
import org.eclipse.scout.rt.shared.services.lookup.ILookupCall;

import com.hohmannit.dungeonmaster.client.common.QuickEditMenu;
import com.hohmannit.dungeonmaster.client.common.QuickNewMenu;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchTablePage.Table;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.grad.ZaubergradCodeType;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.ReichweiteLookupCall;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.schule.SchuleLookupCall;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.WirkungsdauerLookupCall;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.IZauberbuchService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.ZeitaufwandLookupCall;
import com.hohmannit.dungeonmaster.shared.spellbook.ZauberbuchTablePageData;

@Data(ZauberbuchTablePageData.class)
public class ZauberbuchTablePage extends AbstractPageWithTable<Table> {
	@Override
	protected boolean getConfiguredLeaf() {
		return true;
	}

	@Override
	protected void execLoadData(SearchFilter filter) {
		importPageData(BEANS.get(IZauberbuchService.class).getZauberbuchTableData(filter));
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Spellbook;
	}

	@Override
	protected String getConfiguredOverviewIconId() {
		return Icons.Spellbook;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zauber_Zauberbuch_Label_Titel");
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
				ZauberbuchForm form = new ZauberbuchForm();
				form.setId(getIdColumn().getSelectedValue());
				form.addFormListener(new ZauberFormListener());
				// start the form using its modify handler
				form.startModify();
			}
		}

		@Order(20)
		public class NewMenu extends QuickNewMenu {

			@Override
			protected void execAction() {
				ZauberbuchForm form = new ZauberbuchForm();
				form.addFormListener(new ZauberFormListener());
				// start the form using its new handler
				form.startNew();
			}

		}

		private class ZauberFormListener implements FormListener {

			@Override
			public void formChanged(FormEvent e) {
				// reload page to reflect new/changed data after saving any changes
				if (FormEvent.TYPE_CLOSED == e.getType() && e.getForm().isFormStored()) {
					reloadPage();
				}
			}
		}

		public ZeitaufwandColumn getZeitaufwandColumn() {
			return getColumnSet().getColumnByClass(ZeitaufwandColumn.class);
		}

		public ZeitaufwandtypColumn getZeitaufwandTypColumn() {
			return getColumnSet().getColumnByClass(ZeitaufwandtypColumn.class);
		}

		public ReichweiteColumn getReichweiteColumn() {
			return getColumnSet().getColumnByClass(ReichweiteColumn.class);
		}

		public ReichweitetypColumn getReichweiteTypColumn() {
			return getColumnSet().getColumnByClass(ReichweitetypColumn.class);
		}

		public WirkungsdauerColumn getWirkungsdauerColumn() {
			return getColumnSet().getColumnByClass(WirkungsdauerColumn.class);
		}

		public WirkungsdauertypColumn getWirkungsdauerTypColumn() {
			return getColumnSet().getColumnByClass(WirkungsdauertypColumn.class);
		}

		public BeschreibungColumn getBeschreibungColumn() {
			return getColumnSet().getColumnByClass(BeschreibungColumn.class);
		}

		public GradColumn getGradColumn() {
			return getColumnSet().getColumnByClass(GradColumn.class);
		}

		public SchuleColumn getSchuleColumn() {
			return getColumnSet().getColumnByClass(SchuleColumn.class);
		}

		public HoehereGradeColumn getHoehereGradeColumn() {
			return getColumnSet().getColumnByClass(HoehereGradeColumn.class);
		}

		public NameColumn getNameColumn() {
			return getColumnSet().getColumnByClass(NameColumn.class);
		}

		public IdColumn getIdColumn() {
			return getColumnSet().getColumnByClass(IdColumn.class);
		}

		@Order(1000)
		public class IdColumn extends AbstractLongColumn {

			@Override
			protected boolean getConfiguredPrimaryKey() {
				return true;
			}

			@Override
			protected boolean getConfiguredDisplayable() {
				return false;
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
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
				return 200;
			}
		}

		@Order(2500)
		public class GradColumn extends AbstractSmartColumn<Integer> {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zauber_Zauberbuch_Label_Grad");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}

			@Override
			protected Class<? extends ICodeType<?, Integer>> getConfiguredCodeType() {
				return ZaubergradCodeType.class;
			}
		}

		@Order(2750)
		public class SchuleColumn extends AbstractSmartColumn<Long> {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zauber_Schulen_Label_Schule");
			}

			@Override
			protected int getConfiguredWidth() {
				return 168;
			}

			@Override
			protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
				return SchuleLookupCall.class;
			}

			@Override
			protected String getConfiguredHeaderIconId() {
				return Icons.SpellCategory;
			}

		}

		@Order(3000)
		public class ZeitaufwandColumn extends AbstractStringColumn {

			@Override
			protected String getConfiguredHeaderText() {
				return null;
			}

			@Override
			protected int getConfiguredWidth() {
				return 50;
			}

			@Override
			protected String getConfiguredHeaderIconId() {
				return Icons.SpellTime;
			}
		}

		@Order(4000)
		public class ZeitaufwandtypColumn extends AbstractSmartColumn<Long> {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zauber_Zeitaufwand_Label_Titel");
			}

			@Override
			protected int getConfiguredWidth() {
				return 96;
			}

			@Override
			protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
				return ZeitaufwandLookupCall.class;
			}

		}

		@Order(5000)
		public class ReichweiteColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return null;
			}

			@Override
			protected int getConfiguredWidth() {
				return 50;
			}

			@Override
			protected String getConfiguredHeaderIconId() {
				return Icons.SpellDistance;
			}
		}

		@Order(6000)
		public class ReichweitetypColumn extends AbstractSmartColumn<Long> {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zauber_Reichweite_Label_Titel");
			}

			@Override
			protected int getConfiguredWidth() {
				return 248;
			}

			@Override
			protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
				return ReichweiteLookupCall.class;
			}

		}

		@Order(7000)
		public class WirkungsdauerColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return null;
			}

			@Override
			protected int getConfiguredWidth() {
				return 50;
			}

			@Override
			protected String getConfiguredHeaderIconId() {
				return Icons.Duration;
			}
		}

		@Order(8000)
		public class WirkungsdauertypColumn extends AbstractSmartColumn<Long> {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zauber_Wirkungsdauer_Label_Titel");
			}

			@Override
			protected int getConfiguredWidth() {
				return 165;
			}

			@Override
			protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
				return WirkungsdauerLookupCall.class;
			}

		}

		@Order(9000)
		public class BeschreibungColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Allgemein_Beschreibung");
			}

			@Override
			protected int getConfiguredWidth() {
				return 322;
			}
		}

		@Order(10000)
		public class HoehereGradeColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zauber_Zauberbuch_Label_HoehereGrade");
			}

			@Override
			protected int getConfiguredWidth() {
				return 112;
			}
		}

	}
}

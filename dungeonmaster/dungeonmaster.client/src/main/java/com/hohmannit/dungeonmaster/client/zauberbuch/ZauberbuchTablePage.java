package com.hohmannit.dungeonmaster.client.zauberbuch;

import org.eclipse.scout.rt.client.dto.Data;
import org.eclipse.scout.rt.client.ui.basic.table.AbstractTable;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractBigIntegerColumn;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractIntegerColumn;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractSmartColumn;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractStringColumn;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.AbstractPageWithTable;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;
import org.eclipse.scout.rt.shared.services.lookup.ILookupCall;

import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberbuchTablePage.Table;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.spellbook.ZauberbuchTablePageData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZauberbuchService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.reichweite.ReichweiteLookupCall;
import com.hohmannit.dungeonmaster.shared.zauberbuch.typ.ZaubertypLookupCall;
import com.hohmannit.dungeonmaster.shared.zauberbuch.wirkungsdauer.WirkungsdauerLookupCall;
import com.hohmannit.dungeonmaster.shared.zauberbuch.zeitaufwand.ZeitaufwandLookupCall;

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
	protected String getConfiguredTitle() {
		return TEXTS.get("Spellbook");
	}

	public class Table extends AbstractTable {

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

		public ZaubertypColumn getZaubertypColumn() {
			return getColumnSet().getColumnByClass(ZaubertypColumn.class);
		}

		public HoehereGradeColumn getHoehereGradeColumn() {
			return getColumnSet().getColumnByClass(HoehereGradeColumn.class);
		}

		public NameColumn getNameColumn() {
			return getColumnSet().getColumnByClass(NameColumn.class);
		}

		public ZauberIdColumn getZauberIdColumn() {
			return getColumnSet().getColumnByClass(ZauberIdColumn.class);
		}

		@Order(1000)
		public class ZauberIdColumn extends AbstractBigIntegerColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("ZauberID");
			}

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
				return TEXTS.get("Name");
			}

			@Override
			protected int getConfiguredWidth() {
				return 200;
			}
		}

		@Order(2500)
		public class GradColumn extends AbstractIntegerColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zaubergrad");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

		@Order(2750)
		public class ZaubertypColumn extends AbstractSmartColumn<Long> {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zaubertyp");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}

			@Override
			protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
				return ZaubertypLookupCall.class;
			}

		}

		@Order(3000)
		public class ZeitaufwandColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("Zeitaufwand");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

		@Order(4000)
		public class ZeitaufwandtypColumn extends AbstractSmartColumn<Long> {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("ZeitaufwandTyp");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
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
				return TEXTS.get("Reichweite");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

		@Order(6000)
		public class ReichweitetypColumn extends AbstractSmartColumn<Long> {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("ReichweiteTyp");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
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
				return TEXTS.get("Wirkungsdauer");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

		@Order(8000)
		public class WirkungsdauertypColumn extends AbstractSmartColumn<Long> {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("WirkungsdauerTyp");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
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
				return TEXTS.get("Beschreibung");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

		@Order(10000)
		public class HoehereGradeColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("HoehereGrade");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

	}
}

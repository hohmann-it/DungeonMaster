package com.hohmannit.dungeonmaster.client.spellbook;

import org.eclipse.scout.rt.client.dto.Data;
import org.eclipse.scout.rt.client.ui.basic.table.AbstractTable;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractStringColumn;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.AbstractPageWithTable;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.client.spellbook.ZauberbuchTablePage.Table;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.spellbook.ZauberbuchTablePageData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZauberbuchService;

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

		public ZeitaufwandTypColumn getZeitaufwandTypColumn() {
			return getColumnSet().getColumnByClass(ZeitaufwandTypColumn.class);
		}

		public ReichweiteColumn getReichweiteColumn() {
			return getColumnSet().getColumnByClass(ReichweiteColumn.class);
		}

		public ReichweiteTypColumn getReichweiteTypColumn() {
			return getColumnSet().getColumnByClass(ReichweiteTypColumn.class);
		}

		public WirkungsdauerColumn getWirkungsdauerColumn() {
			return getColumnSet().getColumnByClass(WirkungsdauerColumn.class);
		}

		public WirkungsdauerTypColumn getWirkungsdauerTypColumn() {
			return getColumnSet().getColumnByClass(WirkungsdauerTypColumn.class);
		}

		public BeschreibungColumn getBeschreibungColumn() {
			return getColumnSet().getColumnByClass(BeschreibungColumn.class);
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
		public class ZauberIdColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("MyNlsKey");
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
				return 100;
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
		public class ZeitaufwandTypColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("ZeitaufwandTyp");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
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
		public class ReichweiteTypColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("ReichweiteTyp");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
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
		public class WirkungsdauerTypColumn extends AbstractStringColumn {
			@Override
			protected String getConfiguredHeaderText() {
				return TEXTS.get("WirkungsdauerTyp");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
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
				return TEXTS.get("HhereGrade");
			}

			@Override
			protected int getConfiguredWidth() {
				return 100;
			}
		}

	}
}

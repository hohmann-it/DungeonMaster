package com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.basic.table.AbstractTableRowData;
import org.eclipse.scout.rt.shared.data.page.AbstractTablePageData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerTablePage", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class WirkungsdauerTablePageData extends AbstractTablePageData {
	private static final long serialVersionUID = 1L;

	@Override
	public WirkungsdauerTableRowData addRow() {
		return (WirkungsdauerTableRowData) super.addRow();
	}

	@Override
	public WirkungsdauerTableRowData addRow(int rowState) {
		return (WirkungsdauerTableRowData) super.addRow(rowState);
	}

	@Override
	public WirkungsdauerTableRowData createRow() {
		return new WirkungsdauerTableRowData();
	}

	@Override
	public Class<? extends AbstractTableRowData> getRowType() {
		return WirkungsdauerTableRowData.class;
	}

	@Override
	public WirkungsdauerTableRowData[] getRows() {
		return (WirkungsdauerTableRowData[]) super.getRows();
	}

	@Override
	public WirkungsdauerTableRowData rowAt(int index) {
		return (WirkungsdauerTableRowData) super.rowAt(index);
	}

	public void setRows(WirkungsdauerTableRowData[] rows) {
		super.setRows(rows);
	}

	public static class WirkungsdauerTableRowData extends AbstractTableRowData {
		private static final long serialVersionUID = 1L;
		public static final String id = "id";
		public static final String name = "name";
		public static final String beschreibung = "beschreibung";
		private Long m_id;
		private String m_name;
		private String m_beschreibung;

		public Long getId() {
			return m_id;
		}

		public void setId(Long newId) {
			m_id = newId;
		}

		public String getName() {
			return m_name;
		}

		public void setName(String newName) {
			m_name = newName;
		}

		public String getBeschreibung() {
			return m_beschreibung;
		}

		public void setBeschreibung(String newBeschreibung) {
			m_beschreibung = newBeschreibung;
		}
	}
}

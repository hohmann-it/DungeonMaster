package com.hohmannit.dungeonmaster.shared.character;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.basic.table.AbstractTableRowData;
import org.eclipse.scout.rt.shared.data.page.AbstractTablePageData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.datenbank.charaktere.CharakterTablePage", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class CharakterTablePageData extends AbstractTablePageData {
	private static final long serialVersionUID = 1L;

	@Override
	public CharakterTableRowData addRow() {
		return (CharakterTableRowData) super.addRow();
	}

	@Override
	public CharakterTableRowData addRow(int rowState) {
		return (CharakterTableRowData) super.addRow(rowState);
	}

	@Override
	public CharakterTableRowData createRow() {
		return new CharakterTableRowData();
	}

	@Override
	public Class<? extends AbstractTableRowData> getRowType() {
		return CharakterTableRowData.class;
	}

	@Override
	public CharakterTableRowData[] getRows() {
		return (CharakterTableRowData[]) super.getRows();
	}

	@Override
	public CharakterTableRowData rowAt(int index) {
		return (CharakterTableRowData) super.rowAt(index);
	}

	public void setRows(CharakterTableRowData[] rows) {
		super.setRows(rows);
	}

	public static class CharakterTableRowData extends AbstractTableRowData {
		private static final long serialVersionUID = 1L;
		public static final String charakterId = "charakterId";
		public static final String klasse = "klasse";
		public static final String name = "name";
		private String m_charakterId;
		private String m_klasse;
		private String m_name;

		public String getCharakterId() {
			return m_charakterId;
		}

		public void setCharakterId(String newCharakterId) {
			m_charakterId = newCharakterId;
		}

		public String getKlasse() {
			return m_klasse;
		}

		public void setKlasse(String newKlasse) {
			m_klasse = newKlasse;
		}

		public String getName() {
			return m_name;
		}

		public void setName(String newName) {
			m_name = newName;
		}
	}
}

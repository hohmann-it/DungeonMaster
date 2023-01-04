package com.hohmannit.dungeonmaster.shared.zauberbuch;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.basic.table.AbstractTableRowData;
import org.eclipse.scout.rt.shared.data.page.AbstractTablePageData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypTablePage", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class ZeitaufwandtypTablePageData extends AbstractTablePageData {
	private static final long serialVersionUID = 1L;

	@Override
	public ZeitaufwandtypTableRowData addRow() {
		return (ZeitaufwandtypTableRowData) super.addRow();
	}

	@Override
	public ZeitaufwandtypTableRowData addRow(int rowState) {
		return (ZeitaufwandtypTableRowData) super.addRow(rowState);
	}

	@Override
	public ZeitaufwandtypTableRowData createRow() {
		return new ZeitaufwandtypTableRowData();
	}

	@Override
	public Class<? extends AbstractTableRowData> getRowType() {
		return ZeitaufwandtypTableRowData.class;
	}

	@Override
	public ZeitaufwandtypTableRowData[] getRows() {
		return (ZeitaufwandtypTableRowData[]) super.getRows();
	}

	@Override
	public ZeitaufwandtypTableRowData rowAt(int index) {
		return (ZeitaufwandtypTableRowData) super.rowAt(index);
	}

	public void setRows(ZeitaufwandtypTableRowData[] rows) {
		super.setRows(rows);
	}

	public static class ZeitaufwandtypTableRowData extends AbstractTableRowData {
		private static final long serialVersionUID = 1L;
		public static final String id = "id";
		public static final String typ = "typ";
		public static final String kategorie = "kategorie";
		private Long m_id;
		private String m_typ;
		private String m_kategorie;

		public Long getId() {
			return m_id;
		}

		public void setId(Long newId) {
			m_id = newId;
		}

		public String getTyp() {
			return m_typ;
		}

		public void setTyp(String newTyp) {
			m_typ = newTyp;
		}

		public String getKategorie() {
			return m_kategorie;
		}

		public void setKategorie(String newKategorie) {
			m_kategorie = newKategorie;
		}
	}
}
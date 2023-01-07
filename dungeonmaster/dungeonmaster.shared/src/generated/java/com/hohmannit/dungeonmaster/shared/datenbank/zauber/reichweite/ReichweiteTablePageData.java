package com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.basic.table.AbstractTableRowData;
import org.eclipse.scout.rt.shared.data.page.AbstractTablePageData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteTablePage", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class ReichweiteTablePageData extends AbstractTablePageData {
	private static final long serialVersionUID = 1L;

	@Override
	public ReichweiteTableRowData addRow() {
		return (ReichweiteTableRowData) super.addRow();
	}

	@Override
	public ReichweiteTableRowData addRow(int rowState) {
		return (ReichweiteTableRowData) super.addRow(rowState);
	}

	@Override
	public ReichweiteTableRowData createRow() {
		return new ReichweiteTableRowData();
	}

	@Override
	public Class<? extends AbstractTableRowData> getRowType() {
		return ReichweiteTableRowData.class;
	}

	@Override
	public ReichweiteTableRowData[] getRows() {
		return (ReichweiteTableRowData[]) super.getRows();
	}

	@Override
	public ReichweiteTableRowData rowAt(int index) {
		return (ReichweiteTableRowData) super.rowAt(index);
	}

	public void setRows(ReichweiteTableRowData[] rows) {
		super.setRows(rows);
	}

	public static class ReichweiteTableRowData extends AbstractTableRowData {
		private static final long serialVersionUID = 1L;
		public static final String id = "Allgemein_ID";
		public static final String lang = "lang";
		public static final String kurz = "kurz";
		public static final String beschreibung = "beschreibung";
		private Long m_id;
		private String m_lang;
		private String m_kurz;
		private String m_beschreibung;

		public Long getId() {
			return m_id;
		}

		public void setId(Long newId) {
			m_id = newId;
		}

		public String getLang() {
			return m_lang;
		}

		public void setLang(String newLang) {
			m_lang = newLang;
		}

		public String getKurz() {
			return m_kurz;
		}

		public void setKurz(String newKurz) {
			m_kurz = newKurz;
		}

		public String getBeschreibung() {
			return m_beschreibung;
		}

		public void setBeschreibung(String newBeschreibung) {
			m_beschreibung = newBeschreibung;
		}
	}
}

package com.hohmannit.dungeonmaster.shared.spellbook;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.basic.table.AbstractTableRowData;
import org.eclipse.scout.rt.shared.data.page.AbstractTablePageData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.spellbook.ZauberbuchTablePage", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class ZauberbuchTablePageData extends AbstractTablePageData {
	private static final long serialVersionUID = 1L;

	@Override
	public ZauberbuchTableRowData addRow() {
		return (ZauberbuchTableRowData) super.addRow();
	}

	@Override
	public ZauberbuchTableRowData addRow(int rowState) {
		return (ZauberbuchTableRowData) super.addRow(rowState);
	}

	@Override
	public ZauberbuchTableRowData createRow() {
		return new ZauberbuchTableRowData();
	}

	@Override
	public Class<? extends AbstractTableRowData> getRowType() {
		return ZauberbuchTableRowData.class;
	}

	@Override
	public ZauberbuchTableRowData[] getRows() {
		return (ZauberbuchTableRowData[]) super.getRows();
	}

	@Override
	public ZauberbuchTableRowData rowAt(int index) {
		return (ZauberbuchTableRowData) super.rowAt(index);
	}

	public void setRows(ZauberbuchTableRowData[] rows) {
		super.setRows(rows);
	}

	public static class ZauberbuchTableRowData extends AbstractTableRowData {
		private static final long serialVersionUID = 1L;
		public static final String zauberId = "zauberId";
		public static final String name = "name";
		public static final String zeitaufwand = "zeitaufwand";
		public static final String zeitaufwandTyp = "zeitaufwandTyp";
		public static final String reichweite = "reichweite";
		public static final String reichweiteTyp = "reichweiteTyp";
		public static final String wirkungsdauer = "wirkungsdauer";
		public static final String wirkungsdauerTyp = "wirkungsdauerTyp";
		public static final String beschreibung = "beschreibung";
		public static final String hoehereGrade = "hoehereGrade";
		private String m_zauberId;
		private String m_name;
		private String m_zeitaufwand;
		private String m_zeitaufwandTyp;
		private String m_reichweite;
		private String m_reichweiteTyp;
		private String m_wirkungsdauer;
		private String m_wirkungsdauerTyp;
		private String m_beschreibung;
		private String m_hoehereGrade;

		public String getZauberId() {
			return m_zauberId;
		}

		public void setZauberId(String newZauberId) {
			m_zauberId = newZauberId;
		}

		public String getName() {
			return m_name;
		}

		public void setName(String newName) {
			m_name = newName;
		}

		public String getZeitaufwand() {
			return m_zeitaufwand;
		}

		public void setZeitaufwand(String newZeitaufwand) {
			m_zeitaufwand = newZeitaufwand;
		}

		public String getZeitaufwandTyp() {
			return m_zeitaufwandTyp;
		}

		public void setZeitaufwandTyp(String newZeitaufwandTyp) {
			m_zeitaufwandTyp = newZeitaufwandTyp;
		}

		public String getReichweite() {
			return m_reichweite;
		}

		public void setReichweite(String newReichweite) {
			m_reichweite = newReichweite;
		}

		public String getReichweiteTyp() {
			return m_reichweiteTyp;
		}

		public void setReichweiteTyp(String newReichweiteTyp) {
			m_reichweiteTyp = newReichweiteTyp;
		}

		public String getWirkungsdauer() {
			return m_wirkungsdauer;
		}

		public void setWirkungsdauer(String newWirkungsdauer) {
			m_wirkungsdauer = newWirkungsdauer;
		}

		public String getWirkungsdauerTyp() {
			return m_wirkungsdauerTyp;
		}

		public void setWirkungsdauerTyp(String newWirkungsdauerTyp) {
			m_wirkungsdauerTyp = newWirkungsdauerTyp;
		}

		public String getBeschreibung() {
			return m_beschreibung;
		}

		public void setBeschreibung(String newBeschreibung) {
			m_beschreibung = newBeschreibung;
		}

		public String getHoehereGrade() {
			return m_hoehereGrade;
		}

		public void setHoehereGrade(String newHoehereGrade) {
			m_hoehereGrade = newHoehereGrade;
		}
	}
}

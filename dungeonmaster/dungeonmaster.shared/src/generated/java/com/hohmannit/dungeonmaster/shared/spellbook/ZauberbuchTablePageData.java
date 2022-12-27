package com.hohmannit.dungeonmaster.shared.spellbook;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.basic.table.AbstractTableRowData;
import org.eclipse.scout.rt.shared.data.page.AbstractTablePageData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.zauberbuch.ZauberbuchTablePage", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
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
		public static final String grad = "grad";
		public static final String zaubertyp = "zaubertyp";
		public static final String zeitaufwand = "zeitaufwand";
		public static final String zeitaufwandtyp = "zeitaufwandtyp";
		public static final String reichweite = "reichweite";
		public static final String reichweitetyp = "reichweitetyp";
		public static final String wirkungsdauer = "wirkungsdauer";
		public static final String wirkungsdauertyp = "wirkungsdauertyp";
		public static final String beschreibung = "beschreibung";
		public static final String hoehereGrade = "hoehereGrade";
		private Long m_zauberId;
		private String m_name;
		private Integer m_grad;
		private Long m_zaubertyp;
		private String m_zeitaufwand;
		private Long m_zeitaufwandtyp;
		private String m_reichweite;
		private Long m_reichweitetyp;
		private String m_wirkungsdauer;
		private Long m_wirkungsdauertyp;
		private String m_beschreibung;
		private String m_hoehereGrade;

		public Long getZauberId() {
			return m_zauberId;
		}

		public void setZauberId(Long newZauberId) {
			m_zauberId = newZauberId;
		}

		public String getName() {
			return m_name;
		}

		public void setName(String newName) {
			m_name = newName;
		}

		public Integer getGrad() {
			return m_grad;
		}

		public void setGrad(Integer newGrad) {
			m_grad = newGrad;
		}

		public Long getZaubertyp() {
			return m_zaubertyp;
		}

		public void setZaubertyp(Long newZaubertyp) {
			m_zaubertyp = newZaubertyp;
		}

		public String getZeitaufwand() {
			return m_zeitaufwand;
		}

		public void setZeitaufwand(String newZeitaufwand) {
			m_zeitaufwand = newZeitaufwand;
		}

		public Long getZeitaufwandtyp() {
			return m_zeitaufwandtyp;
		}

		public void setZeitaufwandtyp(Long newZeitaufwandtyp) {
			m_zeitaufwandtyp = newZeitaufwandtyp;
		}

		public String getReichweite() {
			return m_reichweite;
		}

		public void setReichweite(String newReichweite) {
			m_reichweite = newReichweite;
		}

		public Long getReichweitetyp() {
			return m_reichweitetyp;
		}

		public void setReichweitetyp(Long newReichweitetyp) {
			m_reichweitetyp = newReichweitetyp;
		}

		public String getWirkungsdauer() {
			return m_wirkungsdauer;
		}

		public void setWirkungsdauer(String newWirkungsdauer) {
			m_wirkungsdauer = newWirkungsdauer;
		}

		public Long getWirkungsdauertyp() {
			return m_wirkungsdauertyp;
		}

		public void setWirkungsdauertyp(Long newWirkungsdauertyp) {
			m_wirkungsdauertyp = newWirkungsdauertyp;
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

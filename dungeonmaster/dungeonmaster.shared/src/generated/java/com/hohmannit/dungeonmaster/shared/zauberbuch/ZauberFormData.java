package com.hohmannit.dungeonmaster.shared.zauberbuch;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.basic.table.AbstractTableRowData;
import org.eclipse.scout.rt.shared.data.form.AbstractFormData;
import org.eclipse.scout.rt.shared.data.form.fields.AbstractValueFieldData;
import org.eclipse.scout.rt.shared.data.form.fields.tablefield.AbstractTableFieldBeanData;
import org.eclipse.scout.rt.shared.data.form.properties.AbstractPropertyData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class ZauberFormData extends AbstractFormData {
	private static final long serialVersionUID = 1L;

	public Beschreibung getBeschreibung() {
		return getFieldByClass(Beschreibung.class);
	}

	public Effekt getEffekt() {
		return getFieldByClass(Effekt.class);
	}

	public Gestik getGestik() {
		return getFieldByClass(Gestik.class);
	}

	public Grad getGrad() {
		return getFieldByClass(Grad.class);
	}

	public Hoeheregrade getHoeheregrade() {
		return getFieldByClass(Hoeheregrade.class);
	}

	/**
	 * access method for property Id.
	 */
	public Long getId() {
		return getIdProperty().getValue();
	}

	/**
	 * access method for property Id.
	 */
	public void setId(Long id) {
		getIdProperty().setValue(id);
	}

	public IdProperty getIdProperty() {
		return getPropertyByClass(IdProperty.class);
	}

	public Konzentration getKonzentration() {
		return getFieldByClass(Konzentration.class);
	}

	public Material getMaterial() {
		return getFieldByClass(Material.class);
	}

	public Name getName() {
		return getFieldByClass(Name.class);
	}

	public Reichweite getReichweite() {
		return getFieldByClass(Reichweite.class);
	}

	public Reichweitetyp getReichweitetyp() {
		return getFieldByClass(Reichweitetyp.class);
	}

	public Rettungswurf getRettungswurf() {
		return getFieldByClass(Rettungswurf.class);
	}

	public Ritual getRitual() {
		return getFieldByClass(Ritual.class);
	}

	public Schule getSchule() {
		return getFieldByClass(Schule.class);
	}

	public Verbal getVerbal() {
		return getFieldByClass(Verbal.class);
	}

	public Wirkungsdauer getWirkungsdauer() {
		return getFieldByClass(Wirkungsdauer.class);
	}

	public Wirkungsdauertyp getWirkungsdauertyp() {
		return getFieldByClass(Wirkungsdauertyp.class);
	}

	public ZaubkomponentenTable getZaubkomponentenTable() {
		return getFieldByClass(ZaubkomponentenTable.class);
	}

	public Zeitaufwand getZeitaufwand() {
		return getFieldByClass(Zeitaufwand.class);
	}

	public Zeitaufwandtyp getZeitaufwandtyp() {
		return getFieldByClass(Zeitaufwandtyp.class);
	}

	public static class Beschreibung extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class Effekt extends AbstractValueFieldData<Long> {
		private static final long serialVersionUID = 1L;
	}

	public static class Gestik extends AbstractValueFieldData<Boolean> {
		private static final long serialVersionUID = 1L;
	}

	public static class Grad extends AbstractValueFieldData<Integer> {
		private static final long serialVersionUID = 1L;
	}

	public static class Hoeheregrade extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class IdProperty extends AbstractPropertyData<Long> {
		private static final long serialVersionUID = 1L;
	}

	public static class Konzentration extends AbstractValueFieldData<Boolean> {
		private static final long serialVersionUID = 1L;
	}

	public static class Material extends AbstractValueFieldData<Boolean> {
		private static final long serialVersionUID = 1L;
	}

	public static class Name extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class Reichweite extends AbstractValueFieldData<Double> {
		private static final long serialVersionUID = 1L;
	}

	public static class Reichweitetyp extends AbstractValueFieldData<Long> {
		private static final long serialVersionUID = 1L;
	}

	public static class Rettungswurf extends AbstractValueFieldData<Long> {
		private static final long serialVersionUID = 1L;
	}

	public static class Ritual extends AbstractValueFieldData<Boolean> {
		private static final long serialVersionUID = 1L;
	}

	public static class Schule extends AbstractValueFieldData<Long> {
		private static final long serialVersionUID = 1L;
	}

	public static class Verbal extends AbstractValueFieldData<Boolean> {
		private static final long serialVersionUID = 1L;
	}

	public static class Wirkungsdauer extends AbstractValueFieldData<Integer> {
		private static final long serialVersionUID = 1L;
	}

	public static class Wirkungsdauertyp extends AbstractValueFieldData<Long> {
		private static final long serialVersionUID = 1L;
	}

	public static class ZaubkomponentenTable extends AbstractTableFieldBeanData {
		private static final long serialVersionUID = 1L;

		@Override
		public ZaubkomponentenTableRowData addRow() {
			return (ZaubkomponentenTableRowData) super.addRow();
		}

		@Override
		public ZaubkomponentenTableRowData addRow(int rowState) {
			return (ZaubkomponentenTableRowData) super.addRow(rowState);
		}

		@Override
		public ZaubkomponentenTableRowData createRow() {
			return new ZaubkomponentenTableRowData();
		}

		@Override
		public Class<? extends AbstractTableRowData> getRowType() {
			return ZaubkomponentenTableRowData.class;
		}

		@Override
		public ZaubkomponentenTableRowData[] getRows() {
			return (ZaubkomponentenTableRowData[]) super.getRows();
		}

		@Override
		public ZaubkomponentenTableRowData rowAt(int index) {
			return (ZaubkomponentenTableRowData) super.rowAt(index);
		}

		public void setRows(ZaubkomponentenTableRowData[] rows) {
			super.setRows(rows);
		}

		public static class ZaubkomponentenTableRowData extends AbstractTableRowData {
			private static final long serialVersionUID = 1L;
			public static final String id = "id";
			public static final String anzahl = "anzahl";
			public static final String name = "name";
			public static final String wert = "wert";
			public static final String gewicht = "gewicht";
			private Long m_id;
			private String m_anzahl;
			private Long m_name;
			private String m_wert;
			private String m_gewicht;

			public Long getId() {
				return m_id;
			}

			public void setId(Long newId) {
				m_id = newId;
			}

			public String getAnzahl() {
				return m_anzahl;
			}

			public void setAnzahl(String newAnzahl) {
				m_anzahl = newAnzahl;
			}

			public Long getName() {
				return m_name;
			}

			public void setName(Long newName) {
				m_name = newName;
			}

			public String getWert() {
				return m_wert;
			}

			public void setWert(String newWert) {
				m_wert = newWert;
			}

			public String getGewicht() {
				return m_gewicht;
			}

			public void setGewicht(String newGewicht) {
				m_gewicht = newGewicht;
			}
		}
	}

	public static class Zeitaufwand extends AbstractValueFieldData<Integer> {
		private static final long serialVersionUID = 1L;
	}

	public static class Zeitaufwandtyp extends AbstractValueFieldData<Long> {
		private static final long serialVersionUID = 1L;
	}
}

package com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.form.AbstractFormData;
import org.eclipse.scout.rt.shared.data.form.fields.AbstractValueFieldData;
import org.eclipse.scout.rt.shared.data.form.properties.AbstractPropertyData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerForm", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class WirkungsdauerFormData extends AbstractFormData {
	private static final long serialVersionUID = 1L;

	public Beschreibung getBeschreibung() {
		return getFieldByClass(Beschreibung.class);
	}

	public Typ getTyp() {
		return getFieldByClass(Typ.class);
	}

	/**
	 * access method for property WirkungsdauerId.
	 */
	public Long getWirkungsdauerId() {
		return getWirkungsdauerIdProperty().getValue();
	}

	/**
	 * access method for property WirkungsdauerId.
	 */
	public void setWirkungsdauerId(Long wirkungsdauerId) {
		getWirkungsdauerIdProperty().setValue(wirkungsdauerId);
	}

	public WirkungsdauerIdProperty getWirkungsdauerIdProperty() {
		return getPropertyByClass(WirkungsdauerIdProperty.class);
	}

	public static class Beschreibung extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class Typ extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class WirkungsdauerIdProperty extends AbstractPropertyData<Long> {
		private static final long serialVersionUID = 1L;
	}
}

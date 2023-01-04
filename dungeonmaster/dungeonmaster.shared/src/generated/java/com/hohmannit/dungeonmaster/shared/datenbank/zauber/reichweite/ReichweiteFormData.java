package com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.form.AbstractFormData;
import org.eclipse.scout.rt.shared.data.form.fields.AbstractValueFieldData;
import org.eclipse.scout.rt.shared.data.form.properties.AbstractPropertyData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteForm", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class ReichweiteFormData extends AbstractFormData {
	private static final long serialVersionUID = 1L;

	public Beschreibung getBeschreibung() {
		return getFieldByClass(Beschreibung.class);
	}

	/**
	 * access method for property ReichweiteId.
	 */
	public Long getReichweiteId() {
		return getReichweiteIdProperty().getValue();
	}

	/**
	 * access method for property ReichweiteId.
	 */
	public void setReichweiteId(Long reichweiteId) {
		getReichweiteIdProperty().setValue(reichweiteId);
	}

	public ReichweiteIdProperty getReichweiteIdProperty() {
		return getPropertyByClass(ReichweiteIdProperty.class);
	}

	public TypKurz getTypKurz() {
		return getFieldByClass(TypKurz.class);
	}

	public TypLang getTypLang() {
		return getFieldByClass(TypLang.class);
	}

	public static class Beschreibung extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class ReichweiteIdProperty extends AbstractPropertyData<Long> {
		private static final long serialVersionUID = 1L;
	}

	public static class TypKurz extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class TypLang extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}
}

package com.hohmannit.dungeonmaster.shared.zauberbuch;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.form.AbstractFormData;
import org.eclipse.scout.rt.shared.data.form.fields.AbstractValueFieldData;
import org.eclipse.scout.rt.shared.data.form.properties.AbstractPropertyData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications
 * recommended.
 */
@Generated(value = "com.hohmannit.dungeonmaster.client.datenbank.zauber.schule.SchuleForm", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class SchuleFormData extends AbstractFormData {
	private static final long serialVersionUID = 1L;

	public Beschreibung getBeschreibung() {
		return getFieldByClass(Beschreibung.class);
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

	public Kategorie getKategorie() {
		return getFieldByClass(Kategorie.class);
	}

	public Name getName() {
		return getFieldByClass(Name.class);
	}

	public static class Beschreibung extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class IdProperty extends AbstractPropertyData<Long> {
		private static final long serialVersionUID = 1L;
	}

	public static class Kategorie extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class Name extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}
}

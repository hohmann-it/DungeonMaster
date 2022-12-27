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
@Generated(value = "com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class ZauberFormData extends AbstractFormData {
	private static final long serialVersionUID = 1L;

	public Name getName() {
		return getFieldByClass(Name.class);
	}

	/**
	 * access method for property SpellId.
	 */
	public Long getSpellId() {
		return getSpellIdProperty().getValue();
	}

	/**
	 * access method for property SpellId.
	 */
	public void setSpellId(Long spellId) {
		getSpellIdProperty().setValue(spellId);
	}

	public SpellIdProperty getSpellIdProperty() {
		return getPropertyByClass(SpellIdProperty.class);
	}

	public static class Name extends AbstractValueFieldData<String> {
		private static final long serialVersionUID = 1L;
	}

	public static class SpellIdProperty extends AbstractPropertyData<Long> {
		private static final long serialVersionUID = 1L;
	}
}

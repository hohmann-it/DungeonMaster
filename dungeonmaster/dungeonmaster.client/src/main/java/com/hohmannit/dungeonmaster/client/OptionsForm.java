/*
 * Copyright (c) 2015 BSI Business Systems Integration AG.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Distribution License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/org/documents/edl-v10.html
 *
 * Contributors:
 *     BSI Business Systems Integration AG - initial API and implementation
 */
package com.hohmannit.dungeonmaster.client;

import java.util.Locale;

import org.eclipse.scout.rt.client.ui.ClientUIPreferences;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractRadioButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.client.ui.form.fields.radiobuttongroup.AbstractRadioButtonGroup;
import org.eclipse.scout.rt.client.ui.form.fields.smartfield.AbstractSmartField;
import org.eclipse.scout.rt.client.ui.messagebox.MessageBoxes;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.classid.ClassId;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.platform.util.ObjectUtility;
import org.eclipse.scout.rt.shared.services.common.code.ICodeType;
import org.eclipse.scout.rt.shared.services.lookup.ILookupCall;

import com.hohmannit.dungeonmaster.client.OptionsForm.MainBox.GroupBox.DenseRadioButtonGroup;
import com.hohmannit.dungeonmaster.client.OptionsForm.MainBox.GroupBox.LocaleField;
import com.hohmannit.dungeonmaster.client.OptionsForm.MainBox.GroupBox.UiThemeField;
import com.hohmannit.dungeonmaster.client.common.AvailableLocaleLookupCall;
import com.hohmannit.dungeonmaster.shared.UiThemeCodeType;
import com.hohmannit.dungeonmaster.shared.UiThemeCodeType.DefaultCode;

@ClassId("002c674c-1e3e-42ca-9fcb-6831fb50fdb6")
public class OptionsForm extends AbstractForm {

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Optionen");
	}

	@Override
	protected void execInitForm() {
		String theme = ObjectUtility.nvl(getDesktop().getTheme(), DefaultCode.ID);
		getUiThemeField().setValue(theme);
		getDenseRadioButtonGroup().setValue(getDesktop().isDense());

		String localeString = ClientUIPreferences.getClientPreferences(ClientSession.get())
				.get(ClientSession.PREF_USER_LOCALE, null);
		if (localeString != null) {
			getLocaleField().setValue(Locale.forLanguageTag(localeString));
		}
	}

	public MainBox getMainBox() {
		return getFieldByClass(MainBox.class);
	}

	public UiThemeField getUiThemeField() {
		return getFieldByClass(UiThemeField.class);
	}

	public DenseRadioButtonGroup getDenseRadioButtonGroup() {
		return getFieldByClass(DenseRadioButtonGroup.class);
	}

	public LocaleField getLocaleField() {
		return getFieldByClass(LocaleField.class);
	}

	protected void storeOptions() {
		// Not inside form handler, because the form is used in a FormToolButton without
		// a handler
		getDesktop().setTheme(getUiThemeField().getValue());
		getDesktop().setDense(getDenseRadioButtonGroup().getValue());
		Locale locale = ObjectUtility.nvl(getLocaleField().getValue(), Locale.getDefault());
		boolean localeChanged = ClientUIPreferences.getClientPreferences(ClientSession.get())
				.put(ClientSession.PREF_USER_LOCALE, locale.toLanguageTag());
		if (localeChanged) {
			ClientUIPreferences.getClientPreferences(ClientSession.get()).flush();
			MessageBoxes.createOk().withBody(TEXTS.get("MasterBar_Optionen_Sprache_Nachricht")).show();
		}
	}

	@Order(10)
	@ClassId("ee807573-30b8-45e1-bdb3-1c487593a8db")
	public class MainBox extends AbstractGroupBox {

		@Override
		protected int getConfiguredGridW() {
			return 1;
		}

		@Order(10)
		@ClassId("cc3211b3-6be4-4a2b-ba56-f1fe616148b5")
		public class GroupBox extends AbstractGroupBox {

			@Override
			protected int getConfiguredGridW() {
				return 1;
			}

			@Override
			protected int getConfiguredGridColumnCount() {
				return 1;
			}

			@Order(10)
			@ClassId("37402c2b-8d3c-4fed-92bd-fdc5cc0869a1")
			public class UiThemeField extends AbstractSmartField<String> {

				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("MasterBar_Optionen_Theme");
				}

				@Override
				protected boolean getConfiguredStatusVisible() {
					return false;
				}

				@Override
				protected Class<? extends ICodeType<?, String>> getConfiguredCodeType() {
					return UiThemeCodeType.class;
				}

				@Override
				protected boolean getConfiguredMandatory() {
					return true;
				}
			}

			@Order(20)
			@ClassId("15fbb4f3-c97b-41a0-8baf-1fafa4aad4ef")
			public class DenseRadioButtonGroup extends AbstractRadioButtonGroup<Boolean> {

				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("MasterBar_Optionen_Layout");
				}

				@Order(10)
				@ClassId("2d15c429-6154-4017-b470-21e94e107667")
				public class DenseButton extends AbstractRadioButton<Boolean> {

					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("MasterBar_Optionen_Kompakt");
					}

					@Override
					protected Boolean getConfiguredRadioValue() {
						return Boolean.TRUE;
					}
				}

				@Order(20)
				@ClassId("72dff217-a9b0-4678-8730-d085f02f3667")
				public class DefaultButton extends AbstractRadioButton<Boolean> {

					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Weit");
					}

					@Override
					protected Boolean getConfiguredRadioValue() {
						return Boolean.FALSE;
					}
				}
			}

			@Order(30)
			@ClassId("7fb9dab3-9474-4579-a0d1-139c4028fd6a")
			public class LocaleField extends AbstractSmartField<Locale> {

				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("MasterBar_Optionen_Sprache");
				}

				@Override
				protected boolean getConfiguredStatusVisible() {
					return false;
				}

				@Override
				protected Class<? extends ILookupCall<Locale>> getConfiguredLookupCall() {
					return AvailableLocaleLookupCall.class;
				}
			}
		}

		@Order(10)
		@ClassId("d19e24a6-2b9a-48ec-8cc1-081bf01f8765")
		public class ApplyButton extends AbstractOkButton {

			@Override
			protected String getConfiguredLabel() {
				return TEXTS.get("Allgemein_Uebernehmen");
			}

			@Override
			protected void execClickAction() {
				storeOptions();
			}
		}
	}
}

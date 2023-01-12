package com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.fields.booleanfield.AbstractBooleanField;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.client.ui.form.fields.sequencebox.AbstractSequenceBox;
import org.eclipse.scout.rt.client.ui.form.fields.smartfield.AbstractSmartField;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.lookup.ILookupCall;

import com.hohmannit.dungeonmaster.client.common.DoubleField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.GroupBox.ZaubermaterialSequenceBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.GroupBox.ZaubermaterialSequenceBox.AnzahlField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.GroupBox.ZaubermaterialSequenceBox.GegenstandField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.GroupBox.ZaubermaterialSequenceBox.WirdVerbrauchtField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.material.GegenstandLookupCall;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.CreateZaubermaterialPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.IZaubermaterialService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.UpdateZaubermaterialPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.ZaubermaterialFormData;

@FormData(value = ZaubermaterialFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ZaubermaterialForm extends AbstractForm {

	private Long id;
	private Long zauberId;

	@FormData
	public Long getId() {
		return id;
	}

	@FormData
	public void setId(Long id) {
		this.id = id;
	}

	@FormData
	public Long getZauberId() {
		return zauberId;
	}

	@FormData
	public void setZauberId(Long zauberId) {
		this.zauberId = zauberId;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zauber_Zauberbuch_Label_Zaubermaterial");
	}

	public MainBox getMainBox() {
		return getFieldByClass(MainBox.class);
	}

	public GroupBox getGroupBox() {
		return getFieldByClass(GroupBox.class);
	}

	public AnzahlField getAnzahlField() {
		return getFieldByClass(ZaubermaterialSequenceBox.AnzahlField.class);
	}

	public ZaubermaterialSequenceBox getZaubermaterialSequenceBox() {
		return getFieldByClass(ZaubermaterialSequenceBox.class);
	}

	public GegenstandField getGegenstandField() {
		return getFieldByClass(GegenstandField.class);
	}

	public WirdVerbrauchtField getWirdVerbrauchtField() {
		return getFieldByClass(WirdVerbrauchtField.class);
	}

	public OkButton getOkButton() {
		return getFieldByClass(OkButton.class);
	}

	public CancelButton getCancelButton() {
		return getFieldByClass(CancelButton.class);
	}

	@Order(1000)
	public class MainBox extends AbstractGroupBox {
		@Order(1000)
		public class GroupBox extends AbstractGroupBox {

			@Order(0)
			public class ZaubermaterialSequenceBox extends AbstractSequenceBox {

				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

				@Override
				protected boolean getConfiguredLabelVisible() {
					return false;
				}

				@Override
				protected boolean getConfiguredAutoCheckFromTo() {
					return false;
				}

				@Order(1000)
				public class AnzahlField extends DoubleField {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Allgemein_Anzahl");
					}

					@Override
					protected Double execValidateValue(Double rawValue) {
						if (rawValue == null) {
							throw new VetoException(TEXTS.get("Fehler_Client_Leer", getConfiguredLabel()));
						}
						return rawValue;
					}
				}

				@Order(2000)
				public class GegenstandField extends AbstractSmartField<Long> {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zauber_Zauberbuch_Label_Gegenstand");
					}

					@Override
					protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
						return GegenstandLookupCall.class;
					}

					@Override
					protected Long execValidateValue(Long rawValue) {
						if (rawValue == null) {
							throw new VetoException(TEXTS.get("Fehler_Client_Leer", getConfiguredLabel()));
						}
						return rawValue;
					}
				}

				@Order(3000)
				public class WirdVerbrauchtField extends AbstractBooleanField {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zauber_Zauberbuch_Label_WirdVerbraucht");
					}
				}

			}

		}

		@Order(2000)
		public class OkButton extends AbstractOkButton {

		}

		@Order(3000)
		public class CancelButton extends AbstractCancelButton {

		}
	}

	public void startModify() {
		startInternalExclusive(new ModifyHandler());
	}

	public void startNew() {
		startInternal(new NewHandler());
	}

	public class NewHandler extends AbstractFormHandler {
		@Override
		protected void execLoad() {
			ZaubermaterialFormData formData = new ZaubermaterialFormData();
			exportFormData(formData);
			formData = BEANS.get(IZaubermaterialService.class).prepareCreate(formData);
			importFormData(formData);

			setEnabledPermission(new CreateZaubermaterialPermission());
		}

		@Override
		protected void execStore() {
			ZaubermaterialFormData formData = new ZaubermaterialFormData();
			exportFormData(formData);
			formData = BEANS.get(IZaubermaterialService.class).create(formData);
			importFormData(formData);
		}
	}

	public class ModifyHandler extends AbstractFormHandler {
		@Override
		protected void execLoad() {
			ZaubermaterialFormData formData = new ZaubermaterialFormData();
			exportFormData(formData);
			formData = BEANS.get(IZaubermaterialService.class).load(formData);
			importFormData(formData);

			setEnabledPermission(new UpdateZaubermaterialPermission());
		}

		@Override
		protected void execStore() {
			ZaubermaterialFormData formData = new ZaubermaterialFormData();
			exportFormData(formData);
			formData = BEANS.get(IZaubermaterialService.class).store(formData);
			importFormData(formData);
		}
	}
}

package com.hohmannit.dungeonmaster.client.datenbank.zauber.zaubertyp;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.client.ui.form.fields.stringfield.AbstractStringField;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.client.datenbank.zauber.zaubertyp.ZaubertypForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zaubertyp.ZaubertypForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zaubertyp.ZaubertypForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zaubertyp.ZaubertypForm.MainBox.GroupBox.KategorieField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zaubertyp.ZaubertypForm.MainBox.GroupBox.TypField;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp.CreateZaubertypPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp.IZaubertypService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zaubertyp.UpdateZaubertypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZaubertypFormData;

@FormData(value = ZaubertypFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ZaubertypForm extends AbstractForm {

	private Long zaubertypId;

	@FormData
	public Long getZaubertypId() {
		return zaubertypId;
	}

	@FormData
	public void setZaubertypId(Long zaubertypId) {
		this.zaubertypId = zaubertypId;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zaubertyp");
	}

	public MainBox getMainBox() {
		return getFieldByClass(MainBox.class);
	}

	public GroupBox getGroupBox() {
		return getFieldByClass(GroupBox.class);
	}

	public TypField getTypField() {
		return getFieldByClass(TypField.class);
	}

	public KategorieField getKategorieField() {
		return getFieldByClass(KategorieField.class);
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

			@Order(1000)
			public class TypField extends AbstractStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Name");
				}

				@Override
				protected int getConfiguredMaxLength() {
					return 128;
				}
			}

			@Order(2000)
			public class KategorieField extends AbstractStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Kategorie");
				}

				@Override
				protected int getConfiguredMaxLength() {
					return 128;
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
			ZaubertypFormData formData = new ZaubertypFormData();
			exportFormData(formData);
			formData = BEANS.get(IZaubertypService.class).prepareCreate(formData);
			importFormData(formData);

			setEnabledPermission(new CreateZaubertypPermission());
		}

		@Override
		protected void execStore() {
			ZaubertypFormData formData = new ZaubertypFormData();
			exportFormData(formData);
			formData = BEANS.get(IZaubertypService.class).create(formData);
			importFormData(formData);
		}
	}

	public class ModifyHandler extends AbstractFormHandler {
		@Override
		protected void execLoad() {
			ZaubertypFormData formData = new ZaubertypFormData();
			exportFormData(formData);
			formData = BEANS.get(IZaubertypService.class).load(formData);
			importFormData(formData);

			setEnabledPermission(new UpdateZaubertypPermission());
		}

		@Override
		protected void execStore() {
			ZaubertypFormData formData = new ZaubertypFormData();
			exportFormData(formData);
			formData = BEANS.get(IZaubertypService.class).store(formData);
			importFormData(formData);
		}
	}
}

package com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZaubermaterialForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.CreateZaubermaterialPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.IZaubermaterialService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.UpdateZaubermaterialPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.ZaubermaterialFormData;

@FormData(value = ZaubermaterialFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ZaubermaterialForm extends AbstractForm {

	private Long id;

	@FormData
	public Long getId() {
		return id;
	}

	@FormData
	public void setId(Long id) {
		this.id = id;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zaubermaterial");
	}

	public MainBox getMainBox() {
		return getFieldByClass(MainBox.class);
	}

	public GroupBox getGroupBox() {
		return getFieldByClass(GroupBox.class);
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

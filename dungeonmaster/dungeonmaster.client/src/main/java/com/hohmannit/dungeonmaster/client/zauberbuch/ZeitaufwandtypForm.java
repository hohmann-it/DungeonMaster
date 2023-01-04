package com.hohmannit.dungeonmaster.client.zauberbuch;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.zauberbuch.CreateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZeitaufwandtypService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.UpdateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandtypFormData;

@FormData(value = ZeitaufwandtypFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ZeitaufwandtypForm extends AbstractForm {

	private Long zeitaufwandtypId;

	@FormData
	public Long getZeitaufwandtypId() {
		return zeitaufwandtypId;
	}

	@FormData
	public void setZeitaufwandtypId(Long zeitaufwandtypId) {
		this.zeitaufwandtypId = zeitaufwandtypId;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zeitaufwandtyp");
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
			ZeitaufwandtypFormData formData = new ZeitaufwandtypFormData();
			exportFormData(formData);
			formData = BEANS.get(IZeitaufwandtypService.class).prepareCreate(formData);
			importFormData(formData);

			setEnabledPermission(new CreateZeitaufwandtypPermission());
		}

		@Override
		protected void execStore() {
			ZeitaufwandtypFormData formData = new ZeitaufwandtypFormData();
			exportFormData(formData);
			formData = BEANS.get(IZeitaufwandtypService.class).create(formData);
			importFormData(formData);
		}
	}

	public class ModifyHandler extends AbstractFormHandler {
		@Override
		protected void execLoad() {
			ZeitaufwandtypFormData formData = new ZeitaufwandtypFormData();
			exportFormData(formData);
			formData = BEANS.get(IZeitaufwandtypService.class).load(formData);
			importFormData(formData);

			setEnabledPermission(new UpdateZeitaufwandtypPermission());
		}

		@Override
		protected void execStore() {
			ZeitaufwandtypFormData formData = new ZeitaufwandtypFormData();
			exportFormData(formData);
			formData = BEANS.get(IZeitaufwandtypService.class).store(formData);
			importFormData(formData);
		}
	}
}

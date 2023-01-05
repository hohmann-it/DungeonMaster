package com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.CreateWirkungsdauerPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.IWirkungsdauerService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.UpdateWirkungsdauerPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.WirkungsdauerFormData;

@FormData(value = WirkungsdauerFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class WirkungsdauerForm extends AbstractForm {
	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Wirkungsdauer");
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
			WirkungsdauerFormData formData = new WirkungsdauerFormData();
			exportFormData(formData);
			formData = BEANS.get(IWirkungsdauerService.class).prepareCreate(formData);
			importFormData(formData);

			setEnabledPermission(new CreateWirkungsdauerPermission());
		}

		@Override
		protected void execStore() {
			WirkungsdauerFormData formData = new WirkungsdauerFormData();
			exportFormData(formData);
			formData = BEANS.get(IWirkungsdauerService.class).create(formData);
			importFormData(formData);
		}
	}

	public class ModifyHandler extends AbstractFormHandler {
		@Override
		protected void execLoad() {
			WirkungsdauerFormData formData = new WirkungsdauerFormData();
			exportFormData(formData);
			formData = BEANS.get(IWirkungsdauerService.class).load(formData);
			importFormData(formData);

			setEnabledPermission(new UpdateWirkungsdauerPermission());
		}

		@Override
		protected void execStore() {
			WirkungsdauerFormData formData = new WirkungsdauerFormData();
			exportFormData(formData);
			formData = BEANS.get(IWirkungsdauerService.class).store(formData);
			importFormData(formData);
		}
	}
}

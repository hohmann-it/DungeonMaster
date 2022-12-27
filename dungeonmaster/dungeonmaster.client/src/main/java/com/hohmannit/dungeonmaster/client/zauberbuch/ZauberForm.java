package com.hohmannit.dungeonmaster.client.zauberbuch;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.IForm;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.zauberbuch.CreateZauberPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZauberService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.UpdateZauberPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZauberFormData;

@FormData(value = ZauberFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ZauberForm extends AbstractForm {

	private Long spellId;

	@FormData
	public Long getSpellId() {
		return spellId;
	}

	@FormData
	public void setSpellId(Long spellId) {
		this.spellId = spellId;
	}

	@Override
	public Object computeExclusiveKey() {
		return getSpellId();
	}

	@Override
	protected int getConfiguredDisplayHint() {
		return IForm.DISPLAY_HINT_VIEW;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zauber");
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
			ZauberFormData formData = new ZauberFormData();
			exportFormData(formData);
			formData = BEANS.get(IZauberService.class).prepareCreate(formData);
			importFormData(formData);

			setEnabledPermission(new CreateZauberPermission());
		}

		@Override
		protected void execStore() {
			ZauberFormData formData = new ZauberFormData();
			exportFormData(formData);
			formData = BEANS.get(IZauberService.class).create(formData);
			importFormData(formData);
		}
	}

	public class ModifyHandler extends AbstractFormHandler {
		@Override
		protected void execLoad() {
			ZauberFormData formData = new ZauberFormData();
			exportFormData(formData);
			formData = BEANS.get(IZauberService.class).load(formData);
			importFormData(formData);

			setEnabledPermission(new UpdateZauberPermission());
		}

		@Override
		protected void execStore() {
			ZauberFormData formData = new ZauberFormData();
			exportFormData(formData);
			formData = BEANS.get(IZauberService.class).store(formData);
			importFormData(formData);
		}
	}
}

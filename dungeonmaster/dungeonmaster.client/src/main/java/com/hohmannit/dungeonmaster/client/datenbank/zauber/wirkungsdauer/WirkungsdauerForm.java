package com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.client.ui.form.fields.labelfield.AbstractLabelField;
import org.eclipse.scout.rt.client.ui.form.fields.stringfield.AbstractStringField;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerForm.MainBox.GroupBox.BeschreibungField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerForm.MainBox.GroupBox.TypField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.wirkungsdauer.WirkungsdauerForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.CreateWirkungsdauerPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.IWirkungsdauerService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.UpdateWirkungsdauerPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.WirkungsdauerFormData;

@FormData(value = WirkungsdauerFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class WirkungsdauerForm extends AbstractForm {

	private Long wirkungsdauerId;

	@FormData
	public Long getWirkungsdauerId() {
		return wirkungsdauerId;
	}

	@FormData
	public void setWirkungsdauerId(Long wirkungsdauerId) {
		this.wirkungsdauerId = wirkungsdauerId;
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Duration;
	}

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

	public TypField getTypField() {
		return getFieldByClass(TypField.class);
	}

	public BeschreibungField getBeschreibungField() {
		return getFieldByClass(BeschreibungField.class);
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
			@FormData(sdkCommand = FormData.SdkCommand.IGNORE)
			public class DescriptionField extends AbstractLabelField {
				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

				@Override
				protected int getConfiguredGridH() {
					return 3;
				}

				@Override
				protected boolean getConfiguredWrapText() {
					return true;
				}

				@Override
				protected boolean getConfiguredLabelVisible() {
					return false;
				}

				@Override
				protected void execInitField() {
					setValue(TEXTS.get("Wirkungsdauer_Beschreibung"));
				}
			}

			@Order(1000)
			public class TypField extends AbstractStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Wirkungsdauer");
				}

				@Override
				protected int getConfiguredMaxLength() {
					return 128;
				}
			}

			@Order(2000)
			public class BeschreibungField extends AbstractStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Beschreibung");
				}

				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

				@Override
				protected int getConfiguredGridH() {
					return 3;
				}

				@Override
				protected boolean getConfiguredMultilineText() {
					return true;
				}

				@Override
				protected boolean getConfiguredWrapText() {
					return true;
				}

				@Override
				protected int getConfiguredMaxLength() {
					return 1500;
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

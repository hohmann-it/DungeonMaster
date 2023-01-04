package com.hohmannit.dungeonmaster.client.zauberbuch;

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

import com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypForm.MainBox.GroupBox.BeschreibungField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypForm.MainBox.GroupBox.DescriptionField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypForm.MainBox.GroupBox.TypField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZeitaufwandtypForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.Icons;
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
	protected String getConfiguredIconId() {
		return Icons.SpellTime;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Type");
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

	public DescriptionField getDescriptionField() {
		return getFieldByClass(DescriptionField.class);
	}

	public BeschreibungField getMyStringField() {
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
			@Override
			protected int getConfiguredGridColumnCount() {
				return 2;
			}

			@Order(0)
			@FormData(sdkCommand = FormData.SdkCommand.IGNORE)
			public class DescriptionField extends AbstractLabelField {
				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

				@Override
				protected int getConfiguredGridH() {
					return 2;
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
					setValue(TEXTS.get("Zauber_Zeitaufwandtyp_Beschreibung"));
				}
			}

			@Order(1000)
			public class TypField extends AbstractStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Zauber_Zeitaufwandtyp_Label");
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
			ZeitaufwandtypFormData formData = new ZeitaufwandtypFormData();
			exportFormData(formData);
			formData = BEANS.get(IZeitaufwandtypService.class).prepareCreate(formData);
			importFormData(formData);

			setEnabledPermission(new CreateZeitaufwandtypPermission());
			setTitle(TEXTS.get("NeuenZeitaufwandtypAnlegen"));
			getDescriptionField().setValue(TEXTS.get("Zauber_Zeitaufwandtyp_Beschreibung"));
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
			setTitle(TEXTS.get("ZeitaufwandtypBearbeiten"));
			setSubTitle(getTypField().getValue());
			getDescriptionField().setValue(TEXTS.get("Zauber_Zeitaufwandtyp_Beschreibung"));
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

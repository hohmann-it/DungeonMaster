package com.hohmannit.dungeonmaster.client.datenbank.zauber.zeitaufwand;

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

import com.hohmannit.dungeonmaster.client.datenbank.zauber.zeitaufwand.ZeitaufwandForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zeitaufwand.ZeitaufwandForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zeitaufwand.ZeitaufwandForm.MainBox.GroupBox.BeschreibungField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zeitaufwand.ZeitaufwandForm.MainBox.GroupBox.NameField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zeitaufwand.ZeitaufwandForm.MainBox.GroupBox.TooltipField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zeitaufwand.ZeitaufwandForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.CreateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.IZeitaufwandtypService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.UpdateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandFormData;

@FormData(value = ZeitaufwandFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ZeitaufwandForm extends AbstractForm {

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
	protected String getConfiguredIconId() {
		return Icons.SpellTime;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zauber_Zeitaufwand_Label_Titel");
	}

	public MainBox getMainBox() {
		return getFieldByClass(MainBox.class);
	}

	public GroupBox getGroupBox() {
		return getFieldByClass(GroupBox.class);
	}

	public NameField getNameField() {
		return getFieldByClass(NameField.class);
	}

	public TooltipField getTooltipField() {
		return getFieldByClass(TooltipField.class);
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
			@Override
			protected int getConfiguredGridColumnCount() {
				return 2;
			}

			@Order(0)
			@FormData(sdkCommand = FormData.SdkCommand.IGNORE)
			public class TooltipField extends AbstractLabelField {
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
					setValue(TEXTS.get("Zauber_Zeitaufwand_Label_Tooltip"));
				}
			}

			@Order(1000)
			public class NameField extends AbstractStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Allgemein_Name");
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
					return TEXTS.get("Allgemein_Beschreibung");
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
			ZeitaufwandFormData formData = new ZeitaufwandFormData();
			exportFormData(formData);
			formData = BEANS.get(IZeitaufwandtypService.class).prepareCreate(formData);
			importFormData(formData);

			setEnabledPermission(new CreateZeitaufwandtypPermission());
		}

		@Override
		protected void execStore() {
			ZeitaufwandFormData formData = new ZeitaufwandFormData();
			exportFormData(formData);
			formData = BEANS.get(IZeitaufwandtypService.class).create(formData);
			importFormData(formData);
		}
	}

	public class ModifyHandler extends AbstractFormHandler {
		@Override
		protected void execLoad() {
			ZeitaufwandFormData formData = new ZeitaufwandFormData();
			exportFormData(formData);
			formData = BEANS.get(IZeitaufwandtypService.class).load(formData);
			importFormData(formData);

			setEnabledPermission(new UpdateZeitaufwandtypPermission());
			setSubTitle(getNameField().getValue());
		}

		@Override
		protected void execStore() {
			ZeitaufwandFormData formData = new ZeitaufwandFormData();
			exportFormData(formData);
			formData = BEANS.get(IZeitaufwandtypService.class).store(formData);
			importFormData(formData);
		}
	}
}

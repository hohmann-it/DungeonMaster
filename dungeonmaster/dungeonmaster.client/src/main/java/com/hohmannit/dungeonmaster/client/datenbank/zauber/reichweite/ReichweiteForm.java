package com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.client.ui.form.fields.imagefield.AbstractImageField;
import org.eclipse.scout.rt.client.ui.form.fields.labelfield.AbstractLabelField;
import org.eclipse.scout.rt.client.ui.form.fields.stringfield.AbstractStringField;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;

import com.hohmannit.dungeonmaster.client.common.NonNullStringField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteForm.MainBox.GroupBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteForm.MainBox.GroupBox.BeschreibungField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteForm.MainBox.GroupBox.DescriptionField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteForm.MainBox.GroupBox.DescriptionImageField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteForm.MainBox.GroupBox.TypKurzField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteForm.MainBox.GroupBox.TypLangField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.reichweite.ReichweiteForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.CreateReichweitePermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.IReichweiteService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.ReichweiteFormData;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.UpdateReichweitePermission;

@FormData(value = ReichweiteFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ReichweiteForm extends AbstractForm {

	private Long reichweiteId;

	@FormData
	public Long getReichweiteId() {
		return reichweiteId;
	}

	@FormData
	public void setReichweiteId(Long reichweiteId) {
		this.reichweiteId = reichweiteId;
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.SpellDistance;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Reichweite");
	}

	public MainBox getMainBox() {
		return getFieldByClass(MainBox.class);
	}

	public GroupBox getGroupBox() {
		return getFieldByClass(GroupBox.class);
	}

	public DescriptionField getDescriptionField() {
		return getFieldByClass(DescriptionField.class);
	}

	public DescriptionImageField getDescriptionImageField() {
		return getFieldByClass(DescriptionImageField.class);
	}

	public TypLangField getTypLangField() {
		return getFieldByClass(TypLangField.class);
	}

	public TypKurzField getTypKurzField() {
		return getFieldByClass(TypKurzField.class);
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

			@Order(1000)
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
					setValue(TEXTS.get("Zauber_Reichweite_Beschreibung"));
				}

			}

			@Order(2000)
			@FormData(sdkCommand = FormData.SdkCommand.IGNORE)
			public class DescriptionImageField extends AbstractImageField {
				@Override
				protected boolean getConfiguredLabelVisible() {
					return false;
				}

				@Override
				protected String getConfiguredImageId() {
					return Icons.ReichweiteDescription;
				}

				@Override
				protected boolean getConfiguredAutoFit() {
					return false;
				}

				@Override
				protected int getConfiguredGridH() {
					return 7;
				}

				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

			}

			@Order(3000)
			public class TypLangField extends NonNullStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("EinheitLang");
				}

				@Override
				protected int getConfiguredMaxLength() {
					return 128;
				}
			}

			@Order(4000)
			public class TypKurzField extends NonNullStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("EinheitKurz");
				}

				@Override
				protected int getConfiguredMaxLength() {
					return 128;
				}
			}

			@Order(5000)
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
			ReichweiteFormData formData = new ReichweiteFormData();
			exportFormData(formData);
			formData = BEANS.get(IReichweiteService.class).prepareCreate(formData);
			importFormData(formData);

			setEnabledPermission(new CreateReichweitePermission());
		}

		@Override
		protected void execStore() {
			ReichweiteFormData formData = new ReichweiteFormData();
			exportFormData(formData);
			formData = BEANS.get(IReichweiteService.class).create(formData);
			importFormData(formData);
		}
	}

	public class ModifyHandler extends AbstractFormHandler {
		@Override
		protected void execLoad() {
			ReichweiteFormData formData = new ReichweiteFormData();
			exportFormData(formData);
			formData = BEANS.get(IReichweiteService.class).load(formData);
			importFormData(formData);

			setEnabledPermission(new UpdateReichweitePermission());
		}

		@Override
		protected void execStore() {
			ReichweiteFormData formData = new ReichweiteFormData();
			exportFormData(formData);
			formData = BEANS.get(IReichweiteService.class).store(formData);
			importFormData(formData);
		}
	}
}

package com.hohmannit.dungeonmaster.client.zauberbuch;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.IForm;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.client.ui.form.fields.imagefield.AbstractImageField;
import org.eclipse.scout.rt.client.ui.form.fields.sequencebox.AbstractSequenceBox;
import org.eclipse.scout.rt.client.ui.form.fields.smartfield.AbstractSmartField;
import org.eclipse.scout.rt.client.ui.form.fields.stringfield.AbstractStringField;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.lookup.ILookupCall;

import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.NameField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZauberImageField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZeitaufwandBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZeitaufwandBox.ZeitaufwandField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZeitaufwandBox.ZeitaufwandtypField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.zauberbuch.CreateZauberPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZauberService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.UpdateZauberPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZauberFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.zeitaufwand.ZeitaufwandLookupCall;

@FormData(value = ZauberFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ZauberForm extends AbstractForm {

	private Long zauberId;

	@FormData
	public Long getZauberId() {
		return zauberId;
	}

	@FormData
	public void setSpellId(Long zauberId) {
		this.zauberId = zauberId;
	}

	@Override
	public Object computeExclusiveKey() {
		return getZauberId();
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

	public ZauberImageField getZauberImageField() {
		return getFieldByClass(ZauberImageField.class);
	}

	public ZeitaufwandField getZeitaufwandField() {
		return getFieldByClass(ZeitaufwandField.class);
	}

	public ZeitaufwandBox getMySequenceBox() {
		return getFieldByClass(ZeitaufwandBox.class);
	}

	public ZeitaufwandtypField getZeitaufwandtypField() {
		return getFieldByClass(ZeitaufwandtypField.class);
	}

	public GeneralBox getGeneralBox() {
		return getFieldByClass(GeneralBox.class);
	}

	public NameField getNameField() {
		return getFieldByClass(NameField.class);
	}

	public OkButton getOkButton() {
		return getFieldByClass(OkButton.class);
	}

	public CancelButton getCancelButton() {
		return getFieldByClass(CancelButton.class);
	}

	@Order(1000)
	public class MainBox extends AbstractGroupBox {

		@Order(0)
		public class GeneralBox extends AbstractGroupBox {
			@Override
			protected int getConfiguredGridColumnCount() {
				return 3;
			}

			@Override
			protected double getConfiguredGridWeightY() {
				// do not allow the general box to grow or shrink vertically.
				return 0;
			}

			@Override
			protected boolean getConfiguredLabelVisible() {
				return false;
			}

			@Order(1000)
			public class ZauberImageField extends AbstractImageField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("ZauberBild");
				}

				@Override
				protected boolean getConfiguredAutoFit() {
					return true;
				}

				@Override
				protected boolean getConfiguredLabelVisible() {
					return false;
				}

				@Override
				protected int getConfiguredGridH() {
					return 1;
				}

				@Override
				protected int getConfiguredGridW() {
					return 1;
				}

				@Override
				protected String getConfiguredImageId() {
					return "zauber/feuerball.png";
				}
			}

			@Order(2000)
			public class NameField extends AbstractStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Name");
				}

				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

				@Override
				protected int getConfiguredGridH() {
					return 1;
				}
			}

			@Order(2500)
			public class ZeitaufwandBox extends AbstractSequenceBox {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Zeitaufwand");
				}

				@Override
				protected boolean getConfiguredAutoCheckFromTo() {
					return false;
				}

				@Override
				protected boolean getConfiguredLabelVisible() {
					return false;
				}

				@Order(3000)
				public class ZeitaufwandField extends AbstractStringField {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zeitaufwand");
					}

					@Override
					protected int getConfiguredMaxLength() {
						return 128;
					}
				}

				@Order(4000)
				public class ZeitaufwandtypField extends AbstractSmartField<Long> {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("ZeitaufwandTyp");
					}

					@Override
					protected boolean getConfiguredLabelVisible() {
						return false;
					}

					@Override // <2>
					protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
						return ZeitaufwandLookupCall.class;
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

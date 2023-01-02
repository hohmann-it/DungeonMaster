package com.hohmannit.dungeonmaster.client.zauberbuch;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.basic.table.AbstractTable;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractStringColumn;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.IForm;
import org.eclipse.scout.rt.client.ui.form.fields.booleanfield.AbstractBooleanField;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractCancelButton;
import org.eclipse.scout.rt.client.ui.form.fields.button.AbstractOkButton;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.client.ui.form.fields.imagefield.AbstractImageField;
import org.eclipse.scout.rt.client.ui.form.fields.integerfield.AbstractIntegerField;
import org.eclipse.scout.rt.client.ui.form.fields.sequencebox.AbstractSequenceBox;
import org.eclipse.scout.rt.client.ui.form.fields.smartfield.AbstractSmartField;
import org.eclipse.scout.rt.client.ui.form.fields.stringfield.AbstractStringField;
import org.eclipse.scout.rt.client.ui.form.fields.tabbox.AbstractTabBox;
import org.eclipse.scout.rt.client.ui.form.fields.tablefield.AbstractTableField;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.code.ICodeType;
import org.eclipse.scout.rt.shared.services.lookup.ILookupCall;

import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.DetailsBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.DetailsBox.BeschreibungField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.DetailsBox.HoeheregradeField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.NameField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ReichweiteSequenceBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ReichweiteSequenceBox.ReichweiteField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ReichweiteSequenceBox.ReichweitetypField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.WirkungsdauerSequenceBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.WirkungsdauerSequenceBox.WirkungsdauerField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.WirkungsdauerSequenceBox.WirkungsdauertypField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZauberImageField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZaubergradSequenceBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZaubergradSequenceBox.GradField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZaubergradSequenceBox.ZaubertypField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZeitaufwandSequenceBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZeitaufwandSequenceBox.ZeitaufwandField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.GeneralBox.ZeitaufwandSequenceBox.ZeitaufwandtypField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.KomponentenBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.KomponentenBox.CharaktereBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.KomponentenBox.ZauberkomponentenBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.KomponentenBox.ZauberkomponentenBox.KomponentenSequenceBox;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.KomponentenBox.ZauberkomponentenBox.KomponentenSequenceBox.GestikField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.KomponentenBox.ZauberkomponentenBox.KomponentenSequenceBox.MaterialField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.KomponentenBox.ZauberkomponentenBox.KomponentenSequenceBox.VerbalField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.KomponentenBox.ZauberkomponentenBox.ZaubkomponentenTableField;
import com.hohmannit.dungeonmaster.client.zauberbuch.ZauberForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.zauberbuch.CreateZauberPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZauberService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.UpdateZauberPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZauberFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.grad.ZaubergradCodeType;
import com.hohmannit.dungeonmaster.shared.zauberbuch.reichweite.ReichweiteLookupCall;
import com.hohmannit.dungeonmaster.shared.zauberbuch.typ.ZaubertypLookupCall;
import com.hohmannit.dungeonmaster.shared.zauberbuch.wirkungsdauer.WirkungsdauerLookupCall;
import com.hohmannit.dungeonmaster.shared.zauberbuch.zeitaufwand.ZeitaufwandLookupCall;

@FormData(value = ZauberFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ZauberForm extends AbstractForm {

	private Long zauberId;

	@FormData
	public Long getZauberId() {
		return zauberId;
	}

	@FormData
	public void setZauberId(Long zauberId) {
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

	public ZeitaufwandtypField getZeitaufwandtypField() {
		return getFieldByClass(ZeitaufwandtypField.class);
	}

	public GeneralBox getGeneralBox() {
		return getFieldByClass(GeneralBox.class);
	}

	public GradField getGradField() {
		return getFieldByClass(GradField.class);
	}

	public ZaubertypField getZaubertypField() {
		return getFieldByClass(ZaubertypField.class);
	}

	public ReichweiteField getReichweiteField() {
		return getFieldByClass(ReichweiteField.class);
	}

	public ReichweitetypField getReichweitetypField() {
		return getFieldByClass(ReichweitetypField.class);
	}

	public WirkungsdauerField getWirkungsdauerField() {
		return getFieldByClass(WirkungsdauerField.class);
	}

	public WirkungsdauertypField getWirkungsdauertypField() {
		return getFieldByClass(WirkungsdauertypField.class);
	}

	public ZeitaufwandSequenceBox getZeitaufwandSequenceBox() {
		return getFieldByClass(ZeitaufwandSequenceBox.class);
	}

	public ReichweiteSequenceBox getReichweiteSequenceBox() {
		return getFieldByClass(ReichweiteSequenceBox.class);
	}

	public WirkungsdauerSequenceBox getWirkungsdauerSequenceBox() {
		return getFieldByClass(WirkungsdauerSequenceBox.class);
	}

	public ZaubergradSequenceBox getZaubergradBox() {
		return getFieldByClass(ZaubergradSequenceBox.class);
	}

	public DetailsBox getDetailsBox() {
		return getFieldByClass(DetailsBox.class);
	}

	public BeschreibungField getBeschreibungField() {
		return getFieldByClass(BeschreibungField.class);
	}

	public KomponentenBox getKomponentenBox() {
		return getFieldByClass(KomponentenBox.class);
	}

	public HoeheregradeField getHoeheregradeField() {
		return getFieldByClass(HoeheregradeField.class);
	}

	public ZauberkomponentenBox getZauberkomponentenBox() {
		return getFieldByClass(ZauberkomponentenBox.class);
	}

	public CharaktereBox getCharaktereBox() {
		return getFieldByClass(CharaktereBox.class);
	}

	public ZaubkomponentenTableField getZaubkomponentenTableField() {
		return getFieldByClass(ZaubkomponentenTableField.class);
	}

	public KomponentenSequenceBox getKomponentenSequenceBox() {
		return getFieldByClass(KomponentenSequenceBox.class);
	}

	public VerbalField getVerbalField() {
		return getFieldByClass(VerbalField.class);
	}

	public GestikField getGestikField() {
		return getFieldByClass(GestikField.class);
	}

	public MaterialField getMaterialField() {
		return getFieldByClass(MaterialField.class);
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
			protected String getConfiguredLabel() {
				return TEXTS.get("Grundinformationen");
			}

			@Override
			protected int getConfiguredGridColumnCount() {
				return 3;
			}

			@Order(1000)
			public class ZauberImageField extends AbstractImageField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("ZauberBild");
				}

				@Override // <2>
				protected Class<NameField> getConfiguredMasterField() {
					return NameField.class;
				}

				@Override // <3>
				protected void execChangedMasterValue(Object newMasterValue) {
					setImageId("zauber/" + ((String) newMasterValue) + ".png");
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
					return 3;
				}

				@Override
				protected String getConfiguredImageId() {
					String imageId = super.getConfiguredImageId();
					if (imageId == null) {
						return "zauber/Standard.png";
					}
					return "zauber/" + imageId + ".png";
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
			}

			@Order(2500)
			public class ZaubergradSequenceBox extends AbstractSequenceBox {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("ZaubergradTyp");
				}

				@Order(3000)
				public class GradField extends AbstractSmartField<Integer> {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zaubergrad");
					}

					@Override
					protected Class<? extends ICodeType<?, Integer>> getConfiguredCodeType() {
						return ZaubergradCodeType.class;
					}

					@Override
					protected boolean getConfiguredLabelVisible() {
						return false;
					}

				}

				@Order(4000)
				public class ZaubertypField extends AbstractSmartField<Long> {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zaubertyp");
					}

					@Override
					protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
						return ZaubertypLookupCall.class;
					}

					@Override
					protected boolean getConfiguredLabelVisible() {
						return false;
					}
				}
			}

			@Order(5000)
			public class ZeitaufwandSequenceBox extends AbstractSequenceBox {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Zeitaufwand");
				}

				@Override
				protected boolean getConfiguredAutoCheckFromTo() {
					return false;
				}

				@Order(1000)
				public class ZeitaufwandField extends AbstractIntegerField {
					@Override
					protected boolean getConfiguredLabelVisible() {
						return false;
					}

				}

				@Order(2000)
				public class ZeitaufwandtypField extends AbstractSmartField<Long> {

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

			@Order(8000)
			public class ReichweiteSequenceBox extends AbstractSequenceBox {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Reichweite");
				}

				@Override
				protected boolean getConfiguredAutoCheckFromTo() {
					return false;
				}

				@Order(1000)
				public class ReichweiteField extends AbstractIntegerField {
					@Override
					protected boolean getConfiguredLabelVisible() {
						return false;
					}
				}

				@Order(2000)
				public class ReichweitetypField extends AbstractSmartField<Long> {
					@Override
					protected boolean getConfiguredLabelVisible() {
						return false;
					}

					@Override
					protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
						return ReichweiteLookupCall.class;
					}
				}
			}

			@Order(9000)
			public class WirkungsdauerSequenceBox extends AbstractSequenceBox {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Wirkungsdauer");
				}

				@Override
				protected boolean getConfiguredAutoCheckFromTo() {
					return false;
				}

				@Order(1000)
				public class WirkungsdauerField extends AbstractIntegerField {
					@Override
					protected boolean getConfiguredLabelVisible() {
						return false;
					}
				}

				@Order(2000)
				public class WirkungsdauertypField extends AbstractSmartField<Long> {
					@Override
					protected boolean getConfiguredLabelVisible() {
						return false;
					}

					@Override
					protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
						return WirkungsdauerLookupCall.class;
					}
				}
			}

		}

		@Order(1000)
		public class DetailsBox extends AbstractGroupBox {
			@Override
			protected String getConfiguredLabel() {
				return TEXTS.get("Beschreibung");
			}

			@Override
			protected int getConfiguredGridH() {
				return 2;
			}

			@Override
			protected boolean getConfiguredFillVertical() {
				return true;
			}

			@Order(1000)
			public class BeschreibungField extends AbstractStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Zauberbeschreibung");
				}

				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

				@Override
				protected int getConfiguredGridH() {
					return 2;
				}

				@Override
				protected boolean getConfiguredMultilineText() {
					return true;
				}

				@Override
				protected boolean getConfiguredWrapText() {
					return true;
				}

			}

			@Order(2000)
			public class HoeheregradeField extends AbstractStringField {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("HoehereGrade");
				}

				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

				@Override
				protected int getConfiguredGridH() {
					return 2;
				}

				@Override
				protected boolean getConfiguredMultilineText() {
					return true;
				}

				@Override
				protected boolean getConfiguredWrapText() {
					return true;
				}

			}

		}

		@Order(1500)
		public class KomponentenBox extends AbstractTabBox {
			@Override
			protected String getConfiguredLabel() {
				return TEXTS.get("KomponentenCharaktere");
			}

			@Order(1000)
			public class ZauberkomponentenBox extends AbstractGroupBox {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Zauberkomponenten");
				}

				@Override
				protected int getConfiguredGridColumnCount() {
					return 3;
				}

				@Order(-1000)
				public class KomponentenSequenceBox extends AbstractSequenceBox {
					@Override
					protected boolean getConfiguredLabelVisible() {
						return false;
					}

					@Override
					protected boolean getConfiguredAutoCheckFromTo() {
						return false;
					}

					@Order(1000)
					public class VerbalField extends AbstractBooleanField {
						@Override
						protected String getConfiguredLabel() {
							return TEXTS.get("Verbal");
						}
					}

					@Order(2000)
					public class GestikField extends AbstractBooleanField {
						@Override
						protected String getConfiguredLabel() {
							return TEXTS.get("Gestik");
						}
					}

					@Order(3000)
					public class MaterialField extends AbstractBooleanField {
						@Override
						protected String getConfiguredLabel() {
							return TEXTS.get("Material");
						}
					}

				}

				@Order(1000)
				public class ZaubkomponentenTableField extends AbstractTableField<ZaubkomponentenTableField.Table> {

					@Override
					protected int getConfiguredGridW() {
						return 3;
					}

					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Material");
					}

					@Override
					protected int getConfiguredGridH() {
						return 6;
					}

					@Override // <2>
					protected Class<MaterialField> getConfiguredMasterField() {
						return MaterialField.class;
					}

					@Override // <3>
					protected void execChangedMasterValue(Object newMasterValue) {
						setEnabled((Boolean) newMasterValue);
					}

					@Override
					protected boolean getConfiguredEnabled() {
						return false;
					}

					public class Table extends AbstractTable {

						public NameColumn getNameColumn() {
							return getColumnSet().getColumnByClass(NameColumn.class);
						}

						public idColumn getidColumn() {
							return getColumnSet().getColumnByClass(idColumn.class);
						}

						@Order(1000)
						public class idColumn extends AbstractStringColumn {
							@Override
							protected String getConfiguredHeaderText() {
								return TEXTS.get("ID");
							}

							@Override
							protected int getConfiguredWidth() {
								return 100;
							}
						}

						@Order(2000)
						public class NameColumn extends AbstractStringColumn {
							@Override
							protected String getConfiguredHeaderText() {
								return TEXTS.get("Name");
							}

							@Override
							protected int getConfiguredWidth() {
								return 100;
							}
						}

					}

				}

			}

			@Order(2000)
			public class CharaktereBox extends AbstractGroupBox {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Charaktere");
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

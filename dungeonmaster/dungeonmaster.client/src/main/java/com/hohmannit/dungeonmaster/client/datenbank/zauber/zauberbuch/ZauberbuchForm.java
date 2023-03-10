package com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.action.menu.IMenu;
import org.eclipse.scout.rt.client.ui.basic.table.AbstractTable;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractLongColumn;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractSmartColumn;
import org.eclipse.scout.rt.client.ui.basic.table.columns.AbstractStringColumn;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.FormEvent;
import org.eclipse.scout.rt.client.ui.form.FormListener;
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
import org.eclipse.scout.rt.platform.exception.ProcessingException;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.code.ICodeType;
import org.eclipse.scout.rt.shared.services.lookup.ILookupCall;

import com.hohmannit.dungeonmaster.client.common.DoubleField;
import com.hohmannit.dungeonmaster.client.common.QuickDeleteMenu;
import com.hohmannit.dungeonmaster.client.common.QuickEditMenu;
import com.hohmannit.dungeonmaster.client.common.QuickNewMenu;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.CancelButton;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.DetailsBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.DetailsBox.BeschreibungField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.DetailsBox.HoeheregradeField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.EffektSequenceBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.EffektSequenceBox.EffektField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.EffektSequenceBox.RettungswurfField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.MyGroupBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.MyGroupBox.GradField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.MyGroupBox.NameField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.MyGroupBox.SchuleField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.ReichweiteSequenceBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.ReichweiteSequenceBox.ReichweiteField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.ReichweiteSequenceBox.ReichweitetypField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.WirkungsdauerSequenceBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.WirkungsdauerSequenceBox.KonzentrationField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.WirkungsdauerSequenceBox.WirkungsdauerField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.WirkungsdauerSequenceBox.WirkungsdauertypField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.ZauberImageField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.ZeitaufwandSequenceBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.ZeitaufwandSequenceBox.ZeitaufwandField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.GeneralBox.ZeitaufwandSequenceBox.ZeitaufwandtypField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.KomponentenBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.KomponentenBox.CharaktereBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.KomponentenBox.ZauberkomponentenBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.KomponentenBox.ZauberkomponentenBox.KomponentenSequenceBox;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.KomponentenBox.ZauberkomponentenBox.KomponentenSequenceBox.GestikField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.KomponentenBox.ZauberkomponentenBox.KomponentenSequenceBox.MaterialField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.KomponentenBox.ZauberkomponentenBox.KomponentenSequenceBox.RitualField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.KomponentenBox.ZauberkomponentenBox.KomponentenSequenceBox.VerbalField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.KomponentenBox.ZauberkomponentenBox.ZaubkomponentenTableField;
import com.hohmannit.dungeonmaster.client.datenbank.zauber.zauberbuch.ZauberbuchForm.MainBox.OkButton;
import com.hohmannit.dungeonmaster.shared.Icons;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.grad.ZaubergradCodeType;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.material.GegenstandLookupCall;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite.ReichweiteLookupCall;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.schule.SchuleLookupCall;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer.WirkungsdauerLookupCall;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.CreateZauberbuchPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.IZauberbuchService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.IZaubermaterialService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.UpdateZauberbuchPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand.ZeitaufwandLookupCall;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZauberFormData;

@FormData(value = ZauberFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class ZauberbuchForm extends AbstractForm {

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
	public Object computeExclusiveKey() {
		return getId();
	}

	@Override
	protected int getConfiguredDisplayHint() {
		return IForm.DISPLAY_HINT_VIEW;
	}

	@Override
	protected String getConfiguredTitle() {
		return TEXTS.get("Zauber_Zauberbuch_Label_Zauber");
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

	public SchuleField getSchuleField() {
		return getFieldByClass(SchuleField.class);
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

	public RitualField getRitualField() {
		return getFieldByClass(RitualField.class);
	}

	public KonzentrationField getKonzentrationField() {
		return getFieldByClass(KonzentrationField.class);
	}

	public EffektSequenceBox getEffektSequenceBox() {
		return getFieldByClass(EffektSequenceBox.class);
	}

	public EffektField getEffektField() {
		return getFieldByClass(EffektField.class);
	}

	public RettungswurfField getRettungswurfField() {
		return getFieldByClass(RettungswurfField.class);
	}

	public MyGroupBox getMyGroupBox() {
		return getFieldByClass(MyGroupBox.class);
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
				return 4;
			}

			@Order(1000)
			public class ZauberImageField extends AbstractImageField {

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
					return 4;
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

			@Order(1500)
			public class MyGroupBox extends AbstractGroupBox {

				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Zauber_Zauberbuch_Label_Grundinformationen");
				}

				@Order(2000)
				public class NameField extends AbstractStringField {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Allgemein_Name");
					}

				}

				@Order(3000)
				public class GradField extends AbstractSmartField<Integer> {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zauber_Zauberbuch_Label_Grad");
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
				public class SchuleField extends AbstractSmartField<Long> {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zauber_Schulen_Label_Schule");
					}

					@Override
					protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
						return SchuleLookupCall.class;
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
					return TEXTS.get("Zauber_Zeitaufwand_Label_Titel");
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
					return TEXTS.get("Zauber_Reichweite_Label_Titel");
				}

				@Override
				protected boolean getConfiguredAutoCheckFromTo() {
					return false;
				}

				@Order(1000)
				public class ReichweiteField extends DoubleField {

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
					return TEXTS.get("Zauber_Wirkungsdauer_Label_Titel");
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

					@Override
					protected int getConfiguredGridW() {
						return 2;
					}
				}

				@Order(3000)
				public class KonzentrationField extends AbstractBooleanField {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zauber_Zauberbuch_Label_Konzentration");
					}

					@Override
					protected int getConfiguredGridW() {
						return 2;
					}

					@Override
					protected String getConfiguredTooltipText() {
						return TEXTS.get("Zauber_Zauberbuch_Label_Konzentration_Tooltip");
					}
				}

			}

			@Order(10000)
			public class EffektSequenceBox extends AbstractSequenceBox {
				@Override
				protected boolean getConfiguredLabelVisible() {
					return false;
				}

				@Override
				protected boolean getConfiguredAutoCheckFromTo() {
					return false;
				}

				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

				@Order(1000)
				public class EffektField extends AbstractSmartField<Long> {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zauber_Zauberbuch_Label_Effekt");
					}
				}

				@Order(2000)
				public class RettungswurfField extends AbstractSmartField<Long> {
					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zauber_Zauberbuch_Label_Rettungswurf");
					}
				}

			}

		}

		@Order(1000)
		public class DetailsBox extends AbstractGroupBox {
			@Override
			protected String getConfiguredLabel() {
				return TEXTS.get("Allgemein_Beschreibung");
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
					return TEXTS.get("Zauber_Zauberbuch_Label_Zauber");
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
					return TEXTS.get("Zauber_Zauberbuch_Label_HoehereGrade");
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
				return TEXTS.get("Zauber_Zauberbuch_Label_HoehereGrade");
			}

			@Order(1000)
			public class ZauberkomponentenBox extends AbstractGroupBox {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Zauber_Zauberbuch_Label_Zauberkomponenten");
				}

				@Override
				protected int getConfiguredGridColumnCount() {
					return 4;
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

					@Override
					protected int getConfiguredGridW() {
						return 4;
					}

					@Order(1000)
					public class MaterialField extends AbstractBooleanField {
						@Override
						protected String getConfiguredLabel() {
							return TEXTS.get("Zauber_Zauberbuch_Label_Material");
						}
					}

					@Order(2000)
					public class VerbalField extends AbstractBooleanField {
						@Override
						protected String getConfiguredLabel() {
							return TEXTS.get("Zauber_Zauberbuch_Label_Verbal");
						}
					}

					@Order(3000)
					public class GestikField extends AbstractBooleanField {
						@Override
						protected String getConfiguredLabel() {
							return TEXTS.get("Zauber_Zauberbuch_Label_Geste");
						}
					}

					@Order(4000)
					public class RitualField extends AbstractBooleanField {
						@Override
						protected String getConfiguredLabel() {
							return TEXTS.get("Zauber_Zauberbuch_Label_Ritual");
						}
					}

				}

				@Order(1000)
				public class ZaubkomponentenTableField extends AbstractTableField<ZaubkomponentenTableField.Table> {

					@Override
					protected int getConfiguredGridW() {
						return 4;
					}

					@Override
					protected String getConfiguredLabel() {
						return TEXTS.get("Zauber_Zauberbuch_Label_Material");
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

					@Override
					protected void execReloadTableData() {
						ZauberFormData formData = new ZauberFormData();
						exportFormData(formData);
						formData = BEANS.get(IZauberbuchService.class).loadZaubermaterial(formData);
						importFormData(formData);
					}

					public class Table extends AbstractTable {
						@Override
						protected boolean getConfiguredAutoResizeColumns() {
							return true;
						}

						public WertColumn getWertColumn() {
							return getColumnSet().getColumnByClass(WertColumn.class);
						}

						public AnzahlColumn getAnzahlColumn() {
							return getColumnSet().getColumnByClass(AnzahlColumn.class);
						}

						public GewichtColumn getGewichtColumn() {
							return getColumnSet().getColumnByClass(GewichtColumn.class);
						}

						public NameColumn getNameColumn() {
							return getColumnSet().getColumnByClass(NameColumn.class);
						}

						public IdColumn getIdColumn() {
							return getColumnSet().getColumnByClass(IdColumn.class);
						}

						@Override
						protected Class<? extends IMenu> getConfiguredDefaultMenu() {
							return EditMenu.class;
						}

						@Order(10)
						public class EditMenu extends QuickEditMenu {

							@Override
							protected void execAction() {
								ZaubermaterialForm form = new ZaubermaterialForm();
								form.setId(getIdColumn().getSelectedValue());
								form.addFormListener(new ZaubermaterialFormListener());
								form.startModify();
							}

						}

						@Order(20)
						public class NewMenu extends QuickNewMenu {

							@Override
							protected void execAction() {
								ZaubermaterialForm form = new ZaubermaterialForm();
								form.setZauberId(getId());
								form.addFormListener(new ZaubermaterialFormListener());
								form.startNew();
							}
						}

						@Order(30)
						public class DeleteMenu extends QuickDeleteMenu {

							@Override
							protected void execAction() throws ProcessingException {
								BEANS.get(IZaubermaterialService.class).delete(getIdColumn().getSelectedValues());
								deleteRow(getSelectedRow());
							}
						}

						private class ZaubermaterialFormListener implements FormListener {

							@Override
							public void formChanged(FormEvent e) {
								// reload page to reflect new/changed data after saving any changes
								if (FormEvent.TYPE_CLOSED == e.getType() && e.getForm().isFormStored()) {
									reloadTableData();
								}
							}
						}

						@Order(1000)
						public class IdColumn extends AbstractLongColumn {
							@Override
							protected String getConfiguredHeaderText() {
								return TEXTS.get("Allgemein_ID");
							}

							@Override
							protected boolean getConfiguredPrimaryKey() {
								return true;
							}

							@Override
							protected boolean getConfiguredDisplayable() {
								return false;
							}
						}

						@Order(1500)
						public class AnzahlColumn extends AbstractStringColumn {
							@Override
							protected String getConfiguredHeaderText() {
								return TEXTS.get("Allgemein_Anzahl");
							}

							@Override
							protected int getConfiguredWidth() {
								return 100;
							}
						}

						@Order(2000)
						public class NameColumn extends AbstractSmartColumn<Long> {
							@Override
							protected String getConfiguredHeaderText() {
								return TEXTS.get("Allgemein_Name");
							}

							@Override
							protected int getConfiguredWidth() {
								return 782;
							}

							@Override
							protected Class<? extends ILookupCall<Long>> getConfiguredLookupCall() {
								return GegenstandLookupCall.class;
							}
						}

						@Order(3000)
						public class WertColumn extends AbstractStringColumn {
							@Override
							protected String getConfiguredHeaderText() {
								return TEXTS.get("Allgemein_Wert");
							}

							@Override
							protected int getConfiguredWidth() {
								return 184;
							}

							@Override
							protected String getConfiguredHeaderIconId() {
								return Icons.Cost;
							}
						}

						@Order(3500)
						public class GewichtColumn extends AbstractStringColumn {
							@Override
							protected String getConfiguredHeaderText() {
								return TEXTS.get("Allgemein_Gewicht");
							}

							@Override
							protected int getConfiguredWidth() {
								return 150;
							}

							@Override
							protected String getConfiguredHeaderIconId() {
								return Icons.Weight;
							}
						}

					}

				}

			}

			@Order(2000)
			public class CharaktereBox extends AbstractGroupBox {
				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Charaktere_Titel");
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
			formData = BEANS.get(IZauberbuchService.class).prepareCreate(formData);
			importFormData(formData);

			setEnabledPermission(new CreateZauberbuchPermission());
		}

		@Override
		protected void execStore() {
			ZauberFormData formData = new ZauberFormData();
			exportFormData(formData);
			formData = BEANS.get(IZauberbuchService.class).create(formData);
			importFormData(formData);
		}
	}

	public class ModifyHandler extends AbstractFormHandler {
		@Override
		protected void execLoad() {
			ZauberFormData formData = new ZauberFormData();
			exportFormData(formData);
			formData = BEANS.get(IZauberbuchService.class).load(formData);
			importFormData(formData);

			setEnabledPermission(new UpdateZauberbuchPermission());
			getForm().setSubTitle(calculateSubTitle()); // <5>
		}

		@Override
		protected void execStore() {
			ZauberFormData formData = new ZauberFormData();
			exportFormData(formData);
			formData = BEANS.get(IZauberbuchService.class).store(formData);
			importFormData(formData);
		}
	}

	protected String calculateSubTitle() {
		return getNameField().getValue();
	}
}

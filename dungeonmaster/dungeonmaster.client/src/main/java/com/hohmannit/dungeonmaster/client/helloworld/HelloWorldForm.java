package com.hohmannit.dungeonmaster.client.helloworld;

import org.eclipse.scout.rt.client.dto.FormData;
import org.eclipse.scout.rt.client.ui.form.AbstractForm;
import org.eclipse.scout.rt.client.ui.form.AbstractFormHandler;
import org.eclipse.scout.rt.client.ui.form.fields.groupbox.AbstractGroupBox;
import org.eclipse.scout.rt.client.ui.form.fields.stringfield.AbstractStringField;
import org.eclipse.scout.rt.platform.BEANS;
import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.AbstractIcons;

import com.hohmannit.dungeonmaster.client.helloworld.HelloWorldForm.MainBox.TopBox;
import com.hohmannit.dungeonmaster.client.helloworld.HelloWorldForm.MainBox.TopBox.MessageField;
import com.hohmannit.dungeonmaster.shared.helloworld.HelloWorldFormData;
import com.hohmannit.dungeonmaster.shared.helloworld.IHelloWorldService;

/**
 * @author phohm
 */
@FormData(value = HelloWorldFormData.class, sdkCommand = FormData.SdkCommand.CREATE)
public class HelloWorldForm extends AbstractForm {

	public HelloWorldForm() {
		setHandler(new ViewHandler());
	}

	@Override
	protected boolean getConfiguredAskIfNeedSave() {
		return false;
	}

	@Override
	protected int getConfiguredModalityHint() {
		return MODALITY_HINT_MODELESS;
	}

	@Override
	protected String getConfiguredIconId() {
		return AbstractIcons.World;
	}

	public MainBox getMainBox() {
		return getFieldByClass(MainBox.class);
	}

	public TopBox getTopBox() {
		return getFieldByClass(TopBox.class);
	}

	public MessageField getMessageField() {
		return getFieldByClass(MessageField.class);
	}

	@Order(1000)
	public class MainBox extends AbstractGroupBox {

		@Order(1000)
		public class TopBox extends AbstractGroupBox {

			@Override
			protected String getConfiguredLabel() {
				return TEXTS.get("MessageFromServer");
			}

			@Order(1000)
			public class MessageField extends AbstractStringField {
				@Override
				protected int getConfiguredGridW() {
					return 2;
				}

				@Override
				protected String getConfiguredLabel() {
					return TEXTS.get("Message");
				}

				@Override
				protected boolean getConfiguredEnabled() {
					return false;
				}
			}
		}
	}

	public class ViewHandler extends AbstractFormHandler {

		@Override
		protected void execLoad() {
			IHelloWorldService service = BEANS.get(IHelloWorldService.class);
			HelloWorldFormData formData = new HelloWorldFormData();
			exportFormData(formData);
			formData = service.load(formData);
			importFormData(formData);
		}
	}
}

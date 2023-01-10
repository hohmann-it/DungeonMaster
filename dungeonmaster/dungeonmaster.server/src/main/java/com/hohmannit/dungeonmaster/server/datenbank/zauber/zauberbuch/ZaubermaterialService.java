package com.hohmannit.dungeonmaster.server.datenbank.zauber.zauberbuch;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;

import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.CreateZaubermaterialPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.IZaubermaterialService;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.ReadZaubermaterialPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.UpdateZaubermaterialPermission;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch.ZaubermaterialFormData;

public class ZaubermaterialService implements IZaubermaterialService {
	@Override
	public ZaubermaterialFormData prepareCreate(ZaubermaterialFormData formData) {
		if (!ACCESS.check(new CreateZaubermaterialPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		// TODO [phohmann] add business logic here.
		return formData;
	}

	@Override
	public ZaubermaterialFormData create(ZaubermaterialFormData formData) {
		if (!ACCESS.check(new CreateZaubermaterialPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		// TODO [phohmann] add business logic here.
		return formData;
	}

	@Override
	public ZaubermaterialFormData load(ZaubermaterialFormData formData) {
		if (!ACCESS.check(new ReadZaubermaterialPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		// TODO [phohmann] add business logic here.
		return formData;
	}

	@Override
	public ZaubermaterialFormData store(ZaubermaterialFormData formData) {
		if (!ACCESS.check(new UpdateZaubermaterialPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		// TODO [phohmann] add business logic here.
		return formData;
	}

	@Override
	public void delete(List<Long> list) {
		// TODO Auto-generated method stub

	}
}

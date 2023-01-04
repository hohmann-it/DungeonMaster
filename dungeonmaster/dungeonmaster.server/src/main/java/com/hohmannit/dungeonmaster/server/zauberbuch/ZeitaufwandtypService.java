package com.hohmannit.dungeonmaster.server.zauberbuch;

import java.util.List;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.zauberbuch.CreateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZeitaufwandtypService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ReadZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.UpdateZeitaufwandtypPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandtypFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandtypTablePageData;

public class ZeitaufwandtypService implements IZeitaufwandtypService {
	@Override
	public ZeitaufwandtypTablePageData getZeitaufwandtypTableData(SearchFilter filter) {
		ZeitaufwandtypTablePageData pageData = new ZeitaufwandtypTablePageData();
		// TODO [Philipp Hohmann] fill pageData.
		return pageData;
	}

	@Override
	public ZeitaufwandtypFormData prepareCreate(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new CreateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		// TODO [Philipp Hohmann] add business logic here.
		return formData;
	}

	@Override
	public ZeitaufwandtypFormData create(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new CreateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		// TODO [Philipp Hohmann] add business logic here.
		return formData;
	}

	@Override
	public ZeitaufwandtypFormData load(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new ReadZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		// TODO [Philipp Hohmann] add business logic here.
		return formData;
	}

	@Override
	public ZeitaufwandtypFormData store(ZeitaufwandtypFormData formData) {
		if (!ACCESS.check(new UpdateZeitaufwandtypPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		// TODO [Philipp Hohmann] add business logic here.
		return formData;
	}

	@Override
	public void delete(List<Long> list) {
		// TODO Auto-generated method stub

	}
}

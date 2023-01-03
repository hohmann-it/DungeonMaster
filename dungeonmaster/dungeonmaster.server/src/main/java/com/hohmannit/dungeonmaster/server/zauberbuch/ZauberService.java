package com.hohmannit.dungeonmaster.server.zauberbuch;

import org.eclipse.scout.rt.platform.exception.VetoException;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.security.ACCESS;
import org.eclipse.scout.rt.server.jdbc.SQL;

import com.hohmannit.dungeonmaster.server.sql.SQLs;
import com.hohmannit.dungeonmaster.shared.zauberbuch.CreateZauberPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.IZauberService;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ReadZauberPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.UpdateZauberPermission;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZauberFormData;

public class ZauberService implements IZauberService {
	@Override
	public ZauberFormData prepareCreate(ZauberFormData formData) {
		if (!ACCESS.check(new CreateZauberPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		return formData;
	}

	@Override
	public ZauberFormData create(ZauberFormData formData) {
		if (!ACCESS.check(new CreateZauberPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.insert(SQLs.ZAUBER_INSERT, formData);
		return formData;
	}

	@Override
	public ZauberFormData load(ZauberFormData formData) {
		if (!ACCESS.check(new ReadZauberPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		SQL.select(SQLs.ZAUBER_SELECT, formData);
		SQL.select(SQLs.ZAUBERMATERIAL_SELECT, formData);
		return formData;
	}

	@Override
	public ZauberFormData store(ZauberFormData formData) {
		if (!ACCESS.check(new UpdateZauberPermission())) {
			throw new VetoException(TEXTS.get("AuthorizationFailed"));
		}
		return formData;
	}
}

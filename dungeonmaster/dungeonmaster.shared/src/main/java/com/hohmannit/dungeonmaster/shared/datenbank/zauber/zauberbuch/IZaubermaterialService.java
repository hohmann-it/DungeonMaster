package com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch;

import java.util.List;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;

@TunnelToServer
public interface IZaubermaterialService extends IService {
	ZaubermaterialFormData prepareCreate(ZaubermaterialFormData formData);

	ZaubermaterialFormData create(ZaubermaterialFormData formData);

	ZaubermaterialFormData load(ZaubermaterialFormData formData);

	ZaubermaterialFormData store(ZaubermaterialFormData formData);

	void delete(List<Long> list);
}

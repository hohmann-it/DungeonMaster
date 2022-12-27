package com.hohmannit.dungeonmaster.shared.zauberbuch;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;

@TunnelToServer
public interface IZauberService extends IService {
	ZauberFormData prepareCreate(ZauberFormData formData);

	ZauberFormData create(ZauberFormData formData);

	ZauberFormData load(ZauberFormData formData);

	ZauberFormData store(ZauberFormData formData);
}

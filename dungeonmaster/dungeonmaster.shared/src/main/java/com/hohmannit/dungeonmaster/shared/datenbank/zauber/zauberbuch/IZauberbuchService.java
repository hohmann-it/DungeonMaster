package com.hohmannit.dungeonmaster.shared.datenbank.zauber.zauberbuch;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.spellbook.ZauberbuchTablePageData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZauberFormData;

@TunnelToServer
public interface IZauberbuchService extends IService {
	ZauberbuchTablePageData getZauberbuchTableData(SearchFilter filter);

	ZauberFormData prepareCreate(ZauberFormData formData);

	ZauberFormData create(ZauberFormData formData);

	ZauberFormData load(ZauberFormData formData);

	ZauberFormData loadZaubermaterial(ZauberFormData formData);

	ZauberFormData store(ZauberFormData formData);
}

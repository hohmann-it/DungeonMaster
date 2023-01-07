package com.hohmannit.dungeonmaster.shared.datenbank.zauber.zeitaufwand;

import java.util.List;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.ZeitaufwandTablePageData;

@TunnelToServer
public interface IZeitaufwandtypService extends IService {
	ZeitaufwandTablePageData getZeitaufwandtypTableData(SearchFilter filter);

	ZeitaufwandFormData prepareCreate(ZeitaufwandFormData formData);

	ZeitaufwandFormData create(ZeitaufwandFormData formData);

	ZeitaufwandFormData load(ZeitaufwandFormData formData);

	ZeitaufwandFormData store(ZeitaufwandFormData formData);

	void delete(List<Long> list);
}

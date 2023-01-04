package com.hohmannit.dungeonmaster.shared.zauberbuch;

import java.util.List;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

@TunnelToServer
public interface IZeitaufwandtypService extends IService {
	ZeitaufwandtypTablePageData getZeitaufwandtypTableData(SearchFilter filter);

	ZeitaufwandtypFormData prepareCreate(ZeitaufwandtypFormData formData);

	ZeitaufwandtypFormData create(ZeitaufwandtypFormData formData);

	ZeitaufwandtypFormData load(ZeitaufwandtypFormData formData);

	ZeitaufwandtypFormData store(ZeitaufwandtypFormData formData);

	void delete(List<Long> list);
}

package com.hohmannit.dungeonmaster.shared.zauberbuch;

import java.util.List;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

@TunnelToServer
public interface IZaubertypService extends IService {
	ZaubertypTablePageData getZaubertypTableData(SearchFilter filter);

	ZaubertypFormData prepareCreate(ZaubertypFormData formData);

	ZaubertypFormData create(ZaubertypFormData formData);

	ZaubertypFormData load(ZaubertypFormData formData);

	ZaubertypFormData store(ZaubertypFormData formData);

	void delete(List<Long> list);
}

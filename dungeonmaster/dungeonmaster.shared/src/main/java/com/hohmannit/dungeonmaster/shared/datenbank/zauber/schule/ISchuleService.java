package com.hohmannit.dungeonmaster.shared.datenbank.zauber.schule;

import java.util.List;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

import com.hohmannit.dungeonmaster.shared.zauberbuch.SchuleFormData;
import com.hohmannit.dungeonmaster.shared.zauberbuch.SchuleTablePageData;

@TunnelToServer
public interface ISchuleService extends IService {
	SchuleTablePageData getSchuleTableData(SearchFilter filter);

	SchuleFormData prepareCreate(SchuleFormData formData);

	SchuleFormData create(SchuleFormData formData);

	SchuleFormData load(SchuleFormData formData);

	SchuleFormData store(SchuleFormData formData);

	void delete(List<Long> list);
}

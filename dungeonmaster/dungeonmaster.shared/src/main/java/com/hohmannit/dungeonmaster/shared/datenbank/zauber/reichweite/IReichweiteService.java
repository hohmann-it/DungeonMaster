package com.hohmannit.dungeonmaster.shared.datenbank.zauber.reichweite;

import java.util.List;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

@TunnelToServer
public interface IReichweiteService extends IService {
	ReichweiteTablePageData getReichweiteTableData(SearchFilter filter);

	ReichweiteFormData prepareCreate(ReichweiteFormData formData);

	ReichweiteFormData create(ReichweiteFormData formData);

	ReichweiteFormData load(ReichweiteFormData formData);

	ReichweiteFormData store(ReichweiteFormData formData);

	void delete(List<Long> list);
}

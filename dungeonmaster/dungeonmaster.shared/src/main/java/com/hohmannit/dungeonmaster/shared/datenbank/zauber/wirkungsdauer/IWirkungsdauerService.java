package com.hohmannit.dungeonmaster.shared.datenbank.zauber.wirkungsdauer;

import java.util.List;

import org.eclipse.scout.rt.platform.service.IService;
import org.eclipse.scout.rt.shared.TunnelToServer;
import org.eclipse.scout.rt.shared.services.common.jdbc.SearchFilter;

@TunnelToServer
public interface IWirkungsdauerService extends IService {
	WirkungsdauerTablePageData getWirkungsdauerTableData(SearchFilter filter);

	WirkungsdauerFormData prepareCreate(WirkungsdauerFormData formData);

	WirkungsdauerFormData create(WirkungsdauerFormData formData);

	WirkungsdauerFormData load(WirkungsdauerFormData formData);

	WirkungsdauerFormData store(WirkungsdauerFormData formData);

	void delete(List<Long> list);
}

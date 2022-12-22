package com.hohmannit.dungeonmaster.client.search;

import org.eclipse.scout.rt.client.ui.desktop.outline.AbstractSearchOutline;
import org.eclipse.scout.rt.platform.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hohmannit.dungeonmaster.shared.Icons;

@Order(2000)
public class SucheOutline extends AbstractSearchOutline {

	private static final Logger LOG = LoggerFactory.getLogger(SucheOutline.class);

	@Override
	protected void execSearch(final String query) {
		LOG.info("Search started");
	}

	@Override
	protected String getConfiguredIconId() {
		return Icons.Search;
	}
}

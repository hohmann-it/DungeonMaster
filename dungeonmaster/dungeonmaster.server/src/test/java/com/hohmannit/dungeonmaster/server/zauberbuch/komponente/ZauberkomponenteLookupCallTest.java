package com.hohmannit.dungeonmaster.server.zauberbuch.komponente;

import java.util.List;

import org.eclipse.scout.rt.shared.services.lookup.ILookupRow;
import org.eclipse.scout.rt.testing.platform.runner.RunWithSubject;
import org.eclipse.scout.rt.testing.server.runner.RunWithServerSession;
import org.eclipse.scout.rt.testing.server.runner.ServerTestRunner;
import org.junit.Test;
import org.junit.runner.RunWith;

import com.hohmannit.dungeonmaster.server.ServerSession;
import com.hohmannit.dungeonmaster.shared.zauberbuch.komponente.ZauberkomponenteLookupCall;

@RunWithSubject("anonymous")
@RunWith(ServerTestRunner.class)
@RunWithServerSession(ServerSession.class)
public class ZauberkomponenteLookupCallTest {
	// TODO [Philipp Hohmann] add test cases

	protected ZauberkomponenteLookupCall createLookupCall() {
		return new ZauberkomponenteLookupCall();
	}

	@Test
	public void testGetDataByAll() {
		ZauberkomponenteLookupCall call = createLookupCall();
		// TODO [Philipp Hohmann] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByAll();
		// TODO [Philipp Hohmann] verify data
	}

	@Test
	public void testGetDataByKey() {
		ZauberkomponenteLookupCall call = createLookupCall();
		// TODO [Philipp Hohmann] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByKey();
		// TODO [Philipp Hohmann] verify data
	}

	@Test
	public void testGetDataByText() {
		ZauberkomponenteLookupCall call = createLookupCall();
		// TODO [Philipp Hohmann] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByText();
		// TODO [Philipp Hohmann] verify data
	}
}

package com.hohmannit.dungeonmaster.server.zauberbuch.material;

import java.util.List;

import org.eclipse.scout.rt.shared.services.lookup.ILookupRow;
import org.eclipse.scout.rt.testing.platform.runner.RunWithSubject;
import org.eclipse.scout.rt.testing.server.runner.RunWithServerSession;
import org.eclipse.scout.rt.testing.server.runner.ServerTestRunner;
import org.junit.Test;
import org.junit.runner.RunWith;

import com.hohmannit.dungeonmaster.server.ServerSession;
import com.hohmannit.dungeonmaster.shared.datenbank.zauber.material.MaterialLookupCall;

@RunWithSubject("anonymous")
@RunWith(ServerTestRunner.class)
@RunWithServerSession(ServerSession.class)
public class MaterialLookupCallTest {
	// TODO [Philipp Hohmann] add test cases

	protected MaterialLookupCall createLookupCall() {
		return new MaterialLookupCall();
	}

	@Test
	public void testGetDataByAll() {
		MaterialLookupCall call = createLookupCall();
		// TODO [Philipp Hohmann] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByAll();
		// TODO [Philipp Hohmann] verify data
	}

	@Test
	public void testGetDataByKey() {
		MaterialLookupCall call = createLookupCall();
		// TODO [Philipp Hohmann] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByKey();
		// TODO [Philipp Hohmann] verify data
	}

	@Test
	public void testGetDataByText() {
		MaterialLookupCall call = createLookupCall();
		// TODO [Philipp Hohmann] fill call
		List<? extends ILookupRow<Long>> data = call.getDataByText();
		// TODO [Philipp Hohmann] verify data
	}
}

package com.hohmannit.dungeonmaster.shared.zauberbuch.grad;

import org.eclipse.scout.rt.platform.Order;
import org.eclipse.scout.rt.platform.text.TEXTS;
import org.eclipse.scout.rt.shared.services.common.code.AbstractCode;
import org.eclipse.scout.rt.shared.services.common.code.AbstractCodeType;

public class ZaubergradCodeType extends AbstractCodeType<String, Integer> {
	private static final long serialVersionUID = 1L;
	public static final String ID = null;

	@Override
	public String getId() {
		return ID;
	}

	@Order(1000)
	public static class ZeroCode extends AbstractCode<String> {

		private static final long serialVersionUID = 1L;
		public static final String ID = "0";

		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Zaubertrick");
		}

		@Override
		public String getId() {
			return ID;
		}
	}

	@Order(2000)
	public static class OneCode extends AbstractCode<String> {

		private static final long serialVersionUID = 1L;
		public static final String ID = "1";

		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Grad1");
		}

		@Override
		public String getId() {
			return ID;
		}
	}

	@Order(3000)
	public static class TwoCode extends AbstractCode<String> {

		private static final long serialVersionUID = 1L;
		public static final String ID = "2";

		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Grad2");
		}

		@Override
		public String getId() {
			return ID;
		}
	}

	@Order(4000)
	public static class ThreeCode extends AbstractCode<String> {

		private static final long serialVersionUID = 1L;
		public static final String ID = "3";

		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Grad3");
		}

		@Override
		public String getId() {
			return ID;
		}
	}

	@Order(5000)
	public static class FourCode extends AbstractCode<String> {

		private static final long serialVersionUID = 1L;
		public static final String ID = "4";

		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Grad4");
		}

		@Override
		public String getId() {
			return ID;
		}
	}

	@Order(6000)
	public static class FiveCode extends AbstractCode<String> {

		private static final long serialVersionUID = 1L;
		public static final String ID = "5";

		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Grad5");
		}

		@Override
		public String getId() {
			return ID;
		}
	}

	@Order(7000)
	public static class SixCode extends AbstractCode<String> {

		private static final long serialVersionUID = 1L;
		public static final String ID = "6";

		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Grad6");
		}

		@Override
		public String getId() {
			return ID;
		}
	}

	@Order(8000)
	public static class SevenCode extends AbstractCode<String> {

		private static final long serialVersionUID = 1L;
		public static final String ID = "7";

		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Grad7");
		}

		@Override
		public String getId() {
			return ID;
		}
	}

	@Order(9000)
	public static class EightCode extends AbstractCode<String> {

		private static final long serialVersionUID = 1L;
		public static final String ID = "8";

		@Override
		protected String getConfiguredText() {
			return TEXTS.get("Grad8");
		}

		@Override
		public String getId() {
			return ID;
		}
	}
}

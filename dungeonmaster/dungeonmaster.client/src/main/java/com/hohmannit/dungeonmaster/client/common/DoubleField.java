package com.hohmannit.dungeonmaster.client.common;

import org.eclipse.scout.rt.client.ui.form.fields.decimalfield.AbstractDecimalField;

public class DoubleField extends AbstractDecimalField<Double> {
	@Override
	protected Double getConfiguredMinValue() {
		return Double.valueOf(0);
	}

	@Override
	protected Double getConfiguredMaxValue() {
		return Double.valueOf(1000);
	}

	@Override
	protected Double getMinPossibleValue() {
		return Double.MIN_VALUE;
	}

	@Override
	protected Double getMaxPossibleValue() {
		return Double.MAX_VALUE;
	}

	@Override
	protected Double parseValueInternal(String text) {
		return Double.parseDouble(text.replace(',', '.'));
	}
}

package org.demogrupsatu.facades.inthebox;

import org.demogrupsatu.facades.inthebox.data.IntheboxData;

import java.util.List;

public interface IntheboxFacade {
    List<IntheboxData> getProductByVariant(String code);
}

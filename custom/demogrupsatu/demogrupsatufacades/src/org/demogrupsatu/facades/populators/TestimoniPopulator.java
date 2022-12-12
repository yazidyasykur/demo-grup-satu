package org.demogrupsatu.facades.populators;

import de.hybris.platform.converters.Populator;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import org.demogrupsatu.core.model.TestimoniModel;
import org.demogrupsatu.facades.testimoni.TestimoniData;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TestimoniPopulator implements Populator<TestimoniModel, TestimoniData> {

    @Override
    public void populate(TestimoniModel source, TestimoniData target) throws ConversionException {
        target.setId(source.getId());
        target.setName(source.getName());
        target.setRating((int) Math.floor(source.getRating()));
        target.setTitle(source.getTitle());
        target.setDescription(source.getDescription());

        Date date = source.getDate();

        DateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy");
        DateFormat timeFormat = new SimpleDateFormat("HH:mm");
        String currentTime = "AM";
        String hourTimeInString = "";

        String minutesTime = timeFormat.format(date).substring(2);
        int hourTime = Integer.parseInt(timeFormat.format(date).substring(0,2));
        if(hourTime > 12) {
            hourTime -= 12;
            currentTime = "PM";
        }

        if(hourTime < 10) {
            hourTimeInString+="0";
        }
        hourTimeInString+=hourTime;

        String strDate = dateFormat.format(date) + " " + hourTimeInString + minutesTime + " " + currentTime;

        target.setDate(strDate);

        Double rate = source.getRating();

        if(rate % 1 >= 0.5) target.setHalfStar(true);
        else target.setHalfStar(false);
    }
}

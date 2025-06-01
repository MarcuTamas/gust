package gust.dto;

import gust.model.Emotion;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SugarLogRequest {

    private int sugarGrams;           // amount of sugar consumed
    private LocalDate date;           // date of consumption
    private int hour;                 // hour of day (0-23)
    private int minute;               // minute of the hour (0-59)

    private String productName;       // optional: product or food name
    private String sugarType;         // optional: Fructose, Glucose, etc.
    private String contextNote;       // optional: user description (e.g., "felt tired, needed energy")

    private Emotion emotion;          // user-selected emotion at the time

    private String location;          // optional: e.g., "Home", "Work", "Party"
    private boolean wasCraving;       // optional: true if it was a craving, false if planned
}
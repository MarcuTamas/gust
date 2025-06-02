package gust.dto;

import gust.model.Emotion;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SugarLogResponse {
    private Long id;
    private int sugarGrams;
    private LocalDate date;
    private int hour;
    private int minute;

    private String productName;
    private String sugarType;
    private String contextNote;

    private Emotion emotion;
    private String location;
    private boolean wasCraving;

    // Optional: enrichments
    private String timeOfDay; // e.g., "Morning", "Afternoon", "Evening"
    private String emotionLabel; // e.g., "Feeling down", based on emotion
}
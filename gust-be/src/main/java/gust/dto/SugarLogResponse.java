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

@freezed
class SugarLogResponse with _$SugarLogResponse {
  const factory SugarLogResponse({
    required int id,
    required int sugarGrams,
    required String date,
    required int hour,
    required int minute,
    required String productName,
    required String sugarType,
    String? contextNote,
    required String emotion,
    String? location,
    @Default(false) bool wasCraving,
    String? timeOfDay,      // <-- add this
    String? emotionLabel,   // <-- add this
  }) = _SugarLogResponse;

  factory SugarLogResponse.fromJson(Map<String, dynamic> json) => _$SugarLogResponseFromJson(json);
}
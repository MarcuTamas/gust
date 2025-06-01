package gust.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;

@Entity
@Table(name = "sugar_logs")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SugarLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** grams of sugar consumed */
    private int sugarGrams;

    /** date when logged */
    private LocalDate date;

    /** hour of the day (0–23) */
    private int hour;

    /** minute of the hour (0–59) */
    private int minute;

    /** product or food name */
    private String productName;

    /** type/category of sugar intake */
    private String sugarType;

    /** any contextual notes */
    private String contextNote;

    /** emotional state during logging */
    @Enumerated(EnumType.STRING)
    private Emotion emotion;

    /** location where intake occurred */
    private String location;

    /** whether it was a craving */
    private boolean wasCraving;

    /** the user who logged this entry */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
}
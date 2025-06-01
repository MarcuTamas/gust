package gust.controller;

import gust.dto.AnalyticsResponse;
import gust.service.AnalyticsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import java.util.List;

@RestController
@RequestMapping("/api/analytics")
@RequiredArgsConstructor
public class AnalyticsController {

    private final AnalyticsService analyticsService;

    // ✅ Emotion summary by month
    @GetMapping("/emotion-summary")
    public ResponseEntity<List<AnalyticsResponse>> getEmotionSummary(
            @RequestParam int month,
            @RequestParam int year
    ) {
        return ResponseEntity.ok(analyticsService.getEmotionSummary(month, year));
    }

    // ✅ Daily trend in a month
    @GetMapping("/daily-trend")
    public ResponseEntity<List<AnalyticsResponse>> getDailyTrend(
            @RequestParam int month,
            @RequestParam int year
    ) {
        return ResponseEntity.ok(analyticsService.getDailyTrend(month, year));
    }

    // ✅ Avg sugar by time of day
    @GetMapping("/time-of-day-pattern")
    public ResponseEntity<List<AnalyticsResponse>> getTimeOfDayPattern() {
        return ResponseEntity.ok(analyticsService.getTimeOfDayPattern());
    }

    // ✅ Monthly sugar total
    @GetMapping("/monthly-total")
    public ResponseEntity<List<AnalyticsResponse>> getMonthlyTotals() {
        return ResponseEntity.ok(analyticsService.getMonthlyTotals());
    }

    // ✅ CSV export
    @GetMapping("/export/csv")
    public ResponseEntity<byte[]> exportCsv() {
        byte[] csvBytes = analyticsService.exportCsv();
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=sugar_log_export.csv")
                .contentType(MediaType.TEXT_PLAIN)
                .body(csvBytes);
    }
}

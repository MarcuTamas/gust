package gust.controller;

import gust.dto.AnalyticsResponse;
import gust.model.User;
import gust.service.AnalyticsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/analytics")
@RequiredArgsConstructor
public class AnalyticsController {

    private final AnalyticsService analyticsService;

    @GetMapping("/emotion-summary")
    public ResponseEntity<List<AnalyticsResponse>> getEmotionSummary(
            @RequestParam int month,
            @RequestParam int year,
            @AuthenticationPrincipal User user
    ) {
        return ResponseEntity.ok(analyticsService.getEmotionSummary(month, year, user));
    }

    @GetMapping("/daily-trend")
    public ResponseEntity<List<AnalyticsResponse>> getDailyTrend(
            @RequestParam int month,
            @RequestParam int year,
            @AuthenticationPrincipal User user
    ) {
        return ResponseEntity.ok(analyticsService.getDailyTrend(month, year, user));
    }

    @GetMapping("/time-of-day-pattern")
    public ResponseEntity<List<AnalyticsResponse>> getTimeOfDayPattern(
            @RequestParam(required = false) Integer month,
            @RequestParam(required = false) Integer year,
            @RequestParam(required = false) String date,
            @AuthenticationPrincipal User user
    ) {
        if (date != null && !date.isBlank()) {
            return ResponseEntity.ok(analyticsService.getTimeOfDayPatternForDay(LocalDate.parse(date), user));
        } else if (month != null && year != null) {
            return ResponseEntity.ok(analyticsService.getTimeOfDayPatternForMonth(month, year, user));
        } else {
            LocalDate now = LocalDate.now();
            return ResponseEntity.ok(analyticsService.getTimeOfDayPatternForMonth(now.getMonthValue(), now.getYear(), user));
        }
    }

    @GetMapping("/monthly-total")
    public ResponseEntity<List<AnalyticsResponse>> getMonthlyTotals(
            @AuthenticationPrincipal User user
    ) {
        return ResponseEntity.ok(analyticsService.getMonthlyTotals(user));
    }

    // Export logs for the authenticated user, filtered by month/year if provided
    @GetMapping("/export/csv")
    public ResponseEntity<byte[]> exportCsv(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false) Integer month,
            @RequestParam(required = false) Integer year
    ) {
        byte[] csvBytes = analyticsService.exportCsv(user, month, year);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=sugar_log_export.csv")
                .contentType(MediaType.TEXT_PLAIN)
                .body(csvBytes);
    }
}

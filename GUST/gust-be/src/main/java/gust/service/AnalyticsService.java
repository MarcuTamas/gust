package gust.service;

import gust.dto.AnalyticsResponse;
import gust.model.SugarLog;
import gust.model.User;
import gust.repository.SugarLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AnalyticsService {

    private final SugarLogRepository sugarLogRepository;

    public List<AnalyticsResponse> getEmotionSummary(int month, int year, User user) {
        List<SugarLog> logs = sugarLogRepository.findByUserAndMonthAndYear(user, month, year);
        int total = logs.stream()
                .mapToInt(SugarLog::getSugarGrams).sum();

        Map<String, Integer> emotionMap = logs.stream()
                .filter(log -> log.getEmotion() != null)
                .collect(Collectors.groupingBy(
                        log -> log.getEmotion().name(),
                        Collectors.summingInt(SugarLog::getSugarGrams)
                ));

        int maxValue = emotionMap.values().stream().max(Integer::compare).orElse(0);

        return emotionMap.entrySet().stream()
                .map(e -> new AnalyticsResponse(
                        e.getKey(),
                        e.getValue(),
                        String.format("%.1f%% of total%s", (100.0 * e.getValue() / Math.max(total, 1)),
                                e.getValue() == maxValue ? " (max)" : "")
                ))
                .collect(Collectors.toList());
    }

    public List<AnalyticsResponse> getDailyTrend(int month, int year, User user) {
        List<SugarLog> logs = sugarLogRepository.findByUserAndMonthAndYear(user, month, year);

        Map<LocalDate, Integer> dateMap = logs.stream()
                .collect(Collectors.groupingBy(
                        SugarLog::getDate,
                        Collectors.summingInt(SugarLog::getSugarGrams)
                ));

        int maxValue = dateMap.values().stream().max(Integer::compare).orElse(0);
        int minValue = dateMap.values().stream().min(Integer::compare).orElse(0);

        return dateMap.entrySet().stream()
                .map(e -> new AnalyticsResponse(
                        e.getKey().toString(),
                        e.getValue(),
                        String.format("This day: %d grams. %s", e.getValue(),
                                e.getValue() == maxValue ? "Highest this month." :
                                        e.getValue() == minValue ? "Lowest this month." : "")
                ))
                .collect(Collectors.toList());
    }

    // ---- Time of day per month (average per slot) ----
    public List<AnalyticsResponse> getTimeOfDayPatternForMonth(int month, int year, User user) {
        List<SugarLog> logs = sugarLogRepository.findByUserAndMonthAndYear(user, month, year);

        Map<String, Double> timeMap = logs.stream()
                .collect(Collectors.groupingBy(this::getTimeSlot,
                        Collectors.averagingInt(SugarLog::getSugarGrams)));

        double maxValue = timeMap.values().stream().max(Double::compare).orElse(0.0);

        return timeMap.entrySet().stream()
                .map(e -> new AnalyticsResponse(
                        e.getKey(),
                        (int) Math.round(e.getValue()),
                        String.format("Avg for %s: %.2f grams%s",
                                e.getKey(),
                                e.getValue(),
                                e.getValue() == maxValue ? " (peak)" : "")
                ))
                .collect(Collectors.toList());
    }

    // ---- Time of day for a specific day (sum per slot) ----
    public List<AnalyticsResponse> getTimeOfDayPatternForDay(LocalDate date, User user) {
        List<SugarLog> logs = sugarLogRepository.findByUserAndDate(user, date);

        Map<String, Integer> timeMap = logs.stream()
                .collect(Collectors.groupingBy(this::getTimeSlot,
                        Collectors.summingInt(SugarLog::getSugarGrams)));

        int maxValue = timeMap.values().stream().max(Integer::compare).orElse(0);

        return timeMap.entrySet().stream()
                .map(e -> new AnalyticsResponse(
                        e.getKey(),
                        e.getValue(),
                        String.format("Total for %s: %d grams%s",
                                e.getKey(),
                                e.getValue(),
                                e.getValue() == maxValue ? " (peak)" : "")
                ))
                .collect(Collectors.toList());
    }

    // ---- Default: time of day for all logs (avg) ----
    public List<AnalyticsResponse> getTimeOfDayPattern(User user) {
        List<SugarLog> logs = sugarLogRepository.findByUser(user);
        Map<String, Double> timeMap = logs.stream()
                .collect(Collectors.groupingBy(this::getTimeSlot,
                        Collectors.averagingInt(SugarLog::getSugarGrams)));

        double maxValue = timeMap.values().stream().max(Double::compare).orElse(0.0);

        return timeMap.entrySet().stream()
                .map(e -> new AnalyticsResponse(
                        e.getKey(),
                        (int) Math.round(e.getValue()),
                        String.format("Average for %s: %.2f grams%s",
                                e.getKey(),
                                e.getValue(),
                                e.getValue() == maxValue ? " (peak)" : "")
                ))
                .collect(Collectors.toList());
    }

    public List<AnalyticsResponse> getMonthlyTotals(User user) {
        List<SugarLog> logs = sugarLogRepository.findByUser(user);
        Map<String, Integer> monthMap = logs.stream()
                .collect(Collectors.groupingBy(
                        log -> log.getDate().getMonth().name(),
                        Collectors.summingInt(SugarLog::getSugarGrams)
                ));
        int maxValue = monthMap.values().stream().max(Integer::compare).orElse(0);

        return monthMap.entrySet().stream()
                .map(e -> new AnalyticsResponse(
                        e.getKey(),
                        e.getValue(),
                        e.getValue() == maxValue ? "Highest monthly total." : ""
                ))
                .collect(Collectors.toList());
    }

    // New method: exportCsv with month/year filter
    public byte[] exportCsv(User user, Integer month, Integer year) {
        List<SugarLog> logs;
        if (month != null && year != null) {
            logs = sugarLogRepository.findByUserAndMonthAndYear(user, month, year);
        } else {
            logs = sugarLogRepository.findByUser(user);
        }

        StringBuilder builder = new StringBuilder();

        // Headers with friendlier display names
        builder.append("Date,Time,Sugar (g),Emotion,Sugar Type,Product,Note\n");

        for (SugarLog log : logs) {
            String date = log.getDate() != null ? log.getDate().toString() : "";
            String time = String.format("%02d:%02d", log.getHour(), log.getMinute());
            String sugarGrams = String.valueOf(log.getSugarGrams());
            String emotion = log.getEmotion() != null ? log.getEmotion().name() : "";
            String sugarType = log.getSugarType() != null ? log.getSugarType() : "";
            String product = log.getProductName() != null ? log.getProductName() : "";
            String note = log.getContextNote() != null ? log.getContextNote() : "";

            // Escape any quotes in text fields
            emotion = emotion.replace("\"", "\"\"");
            sugarType = sugarType.replace("\"", "\"\"");
            product = product.replace("\"", "\"\"");
            note = note.replace("\"", "\"\"");

            builder.append(String.format(
                    "\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"\n",
                    date, time, sugarGrams, emotion, sugarType, product, note
            ));
        }

        return builder.toString().getBytes();
    }

    // Keep old method for backward compatibility (exports all logs for the user)
    public byte[] exportCsv(User user) {
        return exportCsv(user, null, null);
    }

    private String getTimeSlot(SugarLog log) {
        int hour = log.getHour();
        if (hour < 12) return "Morning";
        if (hour < 17) return "Afternoon";
        return "Evening";
    }
}

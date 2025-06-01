package gust.service;

import gust.dto.AnalyticsResponse;
import gust.model.SugarLog;
import gust.repository.SugarLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AnalyticsService {

    private final SugarLogRepository sugarLogRepository;

    public List<AnalyticsResponse> getEmotionSummary(int month, int year) {
        return sugarLogRepository.findAll().stream()
                .filter(log -> log.getDate().getMonthValue() == month && log.getDate().getYear() == year)
                .collect(Collectors.groupingBy(SugarLog::getEmotion, Collectors.summingInt(SugarLog::getSugarGrams)))
                .entrySet().stream()
                .map(e -> new AnalyticsResponse(e.getKey().name(), e.getValue()))
                .collect(Collectors.toList());
    }

    public List<AnalyticsResponse> getDailyTrend(int month, int year) {
        return sugarLogRepository.findAll().stream()
                .filter(log -> log.getDate().getMonthValue() == month && log.getDate().getYear() == year)
                .collect(Collectors.groupingBy(SugarLog::getDate, Collectors.summingInt(SugarLog::getSugarGrams)))
                .entrySet().stream()
                .map(e -> new AnalyticsResponse(e.getKey().toString(), e.getValue()))
                .collect(Collectors.toList());
    }

    public List<AnalyticsResponse> getTimeOfDayPattern() {
        return sugarLogRepository.findAll().stream()
                .collect(Collectors.groupingBy(this::getTimeSlot, Collectors.averagingInt(SugarLog::getSugarGrams)))
                .entrySet().stream()
                .map(e -> new AnalyticsResponse(e.getKey(), (int) Math.round(e.getValue())))
                .collect(Collectors.toList());
    }

    public List<AnalyticsResponse> getMonthlyTotals() {
        return sugarLogRepository.findAll().stream()
                .collect(Collectors.groupingBy(log -> log.getDate().getMonth().name(),
                        Collectors.summingInt(SugarLog::getSugarGrams)))
                .entrySet().stream()
                .map(e -> new AnalyticsResponse(e.getKey(), e.getValue()))
                .collect(Collectors.toList());
    }

    public byte[] exportCsv() {
        List<SugarLog> logs = sugarLogRepository.findAll();
        StringBuilder builder = new StringBuilder("Date,Hour,Minute,SugarGrams,Emotion,SugarType,Product,Note\n");

        for (SugarLog log : logs) {
            builder.append(String.format("%s,%d,%d,%d,%s,%s,%s,%s\n",
                    log.getDate(),
                    log.getHour(),
                    log.getMinute(),
                    log.getSugarGrams(),
                    log.getEmotion() != null ? log.getEmotion().name() : "",
                    log.getSugarType(),
                    log.getProductName(),
                    log.getContextNote()));
        }

        return builder.toString().getBytes();
    }

    private String getTimeSlot(SugarLog log) {
        int hour = log.getHour();
        if (hour < 12) return "Morning";
        if (hour < 17) return "Afternoon";
        return "Evening";
    }
}

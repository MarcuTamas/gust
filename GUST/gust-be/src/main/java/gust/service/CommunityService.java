package gust.service;

import gust.dto.UserRankingResponse;
import gust.model.SugarLog;
import gust.repository.SugarLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CommunityService {

    private final SugarLogRepository sugarLogRepository;

    public List<UserRankingResponse> getRankings(String period) {
        List<SugarLog> allLogs = sugarLogRepository.findAll();

        LocalDate now = LocalDate.now();
        List<SugarLog> filteredLogs = switch (period) {
            case "daily" -> allLogs.stream()
                    .filter(log -> log.getDate().equals(now))
                    .toList();
            case "monthly" -> allLogs.stream()
                    .filter(log -> log.getDate().getMonthValue() == now.getMonthValue() &&
                            log.getDate().getYear() == now.getYear())
                    .toList();
            case "yearly" -> allLogs.stream()
                    .filter(log -> log.getDate().getYear() == now.getYear())
                    .toList();
            default -> throw new IllegalArgumentException("Invalid period: " + period);
        };

        return filteredLogs.stream()
                .collect(Collectors.groupingBy(
                        log -> log.getUser().getUsername(),  // 🛠 Assumes SugarLog has getUser()
                        Collectors.summingInt(SugarLog::getSugarGrams)
                ))
                .entrySet().stream()
                .sorted(Map.Entry.comparingByValue())  // Lowest sugar comes first
                .map(e -> new UserRankingResponse(e.getKey(), e.getValue()))
                .collect(Collectors.toList());
    }
}

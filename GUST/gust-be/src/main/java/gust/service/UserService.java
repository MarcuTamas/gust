package gust.service;

import gust.model.SugarLog;
import gust.model.User;
import gust.repository.SugarLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

// gust.service.UserService (or AnalyticsService)
@Service
@RequiredArgsConstructor
public class UserService {
    private final SugarLogRepository sugarLogRepo;

    /**
     * Returns how many days in a row (including today) the user has at least one sugar-log.
     */
    public int calculateStreak(User user) {
        // pull all logs for this user
        List<SugarLog> logs = sugarLogRepo.findByUserOrderByDateDesc(user);

        // extract just the dates into a Set for O(1) lookups
        Set<LocalDate> daysWithLogs = logs.stream()
                .map(SugarLog::getDate)
                .collect(Collectors.toSet());

        // walk backwards from today
        LocalDate today = LocalDate.now();
        int streak = 0;
        while (daysWithLogs.contains(today)) {
            streak++;
            today = today.minusDays(1);
        }
        return streak;
    }
}


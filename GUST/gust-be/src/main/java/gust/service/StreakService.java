package gust.service;

import gust.model.User;
import gust.repository.SugarLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class StreakService {

    private final SugarLogRepository sugarLogRepository;

    /**
     * Returns the number of consecutive calendar days up to today
     * on which the user has logged at least one sugar entry.
     */
    public int getStreak(User user) {
        List<LocalDate> dates = sugarLogRepository.findAllDistinctDatesByUser(user);
        if (dates.isEmpty()) {
            return 0;
        }
        dates.sort((a, b) -> b.compareTo(a)); // Sort descending: most recent first
        LocalDate today = LocalDate.now();

        // If latest log is not today, streak is zero
        if (!dates.get(0).equals(today)) {
            return 0;
        }

        int streak = 1;
        LocalDate prev = today;

        // Start from the second most recent
        for (int i = 1; i < dates.size(); i++) {
            LocalDate date = dates.get(i);
            if (date.equals(prev.minusDays(1))) {
                streak++;
                prev = date;
            } else {
                // If there is a gap, break
                break;
            }
        }
        return streak;
    }

}

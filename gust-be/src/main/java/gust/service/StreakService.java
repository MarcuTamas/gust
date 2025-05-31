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

        int streak = 0;
        LocalDate today = LocalDate.now();
        for (LocalDate d : dates) {
            // for streak == 0 check if d == today,
            // for streak == 1 check if d == today.minusDays(1), etc.
            if (d.equals(today.minusDays(streak))) {
                streak++;
            } else {
                break;
            }
        }
        return streak;
    }
}

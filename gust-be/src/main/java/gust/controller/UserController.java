package gust.controller;

import gust.dto.StreakResponse;
import gust.model.User;
import gust.service.StreakService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final StreakService streakService;

    /**
     * GET /api/users/me/streak
     * Returns the current user's streak of consecutive days.
     */
    @GetMapping("/me/streak")
    public ResponseEntity<StreakResponse> getMyStreak(
            @AuthenticationPrincipal User user
    ) {
        int streak = streakService.getStreak(user);
        return ResponseEntity.ok(new StreakResponse(streak));
    }
}

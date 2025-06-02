package gust.controller;

import gust.dto.StreakResponse;
import gust.dto.UserProfileResponse;
import gust.dto.UserProfileUpdateRequest;
import gust.model.User;
import gust.repository.UserRepository;
import gust.service.StreakService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final StreakService streakService;
    private final UserRepository userRepository;

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

    /**
     * GET /api/users/me/profile
     * Returns current user's profile: full name, email, goal, etc.
     */
    @GetMapping("/me/profile")
    public ResponseEntity<UserProfileResponse> getMyProfile(
            @AuthenticationPrincipal User user
    ) {
        User found = userRepository.findByEmail(user.getEmail())
                .orElseThrow(() -> new RuntimeException("User not found"));
        return ResponseEntity.ok(UserProfileResponse.from(found));
    }

    /**
     * PATCH /api/users/me/profile
     * Updates current user's profile fields: name/email/goal (optional).
     */
    @PatchMapping("/me/profile")
    public ResponseEntity<?> updateProfile(
            @AuthenticationPrincipal User user,
            @RequestBody UserProfileUpdateRequest req
    ) {
        User found = userRepository.findByEmail(user.getEmail())
                .orElseThrow(() -> new RuntimeException("User not found"));
        boolean updated = false;

        if (req.getFullName() != null && !req.getFullName().isBlank()) {
            found.setFullName(req.getFullName());
            updated = true;
        }
        if (req.getEmail() != null && !req.getEmail().equals(found.getEmail())) {
            // Optional: check email uniqueness!
            if (userRepository.findByEmail(req.getEmail()).isPresent()) {
                return ResponseEntity.badRequest().body("Email already in use.");
            }
            found.setEmail(req.getEmail());
            updated = true;
        }
        if (req.getDailySugarGoal() != null && req.getDailySugarGoal() > 0) {
            found.setDailySugarGoal(req.getDailySugarGoal());
            updated = true;
        }

        if (!updated) {
            return ResponseEntity.badRequest().body("No changes provided.");
        }

        userRepository.save(found);
        return ResponseEntity.ok(UserProfileResponse.from(found));
    }

    /**
     * PATCH /api/users/me/goal
     * (Kept for backwards compatibility)
     */
    @PatchMapping("/me/goal")
    public ResponseEntity<?> updateDailyGoal(
            @AuthenticationPrincipal User user,
            @RequestBody Map<String, Integer> req
    ) {
        Integer newGoal = req.get("goal");
        if (newGoal == null || newGoal < 1) {
            return ResponseEntity.badRequest().body("Goal must be a positive integer.");
        }
        User found = userRepository.findByEmail(user.getEmail())
                .orElseThrow(() -> new RuntimeException("User not found"));
        found.setDailySugarGoal(newGoal);
        userRepository.save(found);
        return ResponseEntity.ok().build();
    }
}

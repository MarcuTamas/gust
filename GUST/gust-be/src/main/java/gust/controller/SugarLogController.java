package gust.controller;

import gust.dto.SugarLogRequest;
import gust.dto.SugarLogResponse;
import gust.model.User;
import gust.service.SugarLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/sugarlogs")
@RequiredArgsConstructor
public class SugarLogController {

    private final SugarLogService sugarLogService;

    // ✅ Create new log (for current user)
    @PostMapping
    public ResponseEntity<SugarLogResponse> createLog(
            @AuthenticationPrincipal User user,
            @RequestBody SugarLogRequest request
    ) {
        return ResponseEntity.ok(sugarLogService.addLog(user, request));
    }

    // ✅ Get all logs for current user
    @GetMapping
    public ResponseEntity<List<SugarLogResponse>> getMyLogs(
            @AuthenticationPrincipal User user
    ) {
        return ResponseEntity.ok(sugarLogService.getAllLogs(user));
    }

    // ✅ Get logs by date for current user
    @GetMapping("/by-date")
    public ResponseEntity<List<SugarLogResponse>> getLogsByDate(
            @AuthenticationPrincipal User user,
            @RequestParam String date
    ) {
        LocalDate parsedDate = LocalDate.parse(date);
        return ResponseEntity.ok(sugarLogService.getLogsByDate(user, parsedDate));
    }

    // ✅ Get log by ID for current user only
    @GetMapping("/{id}")
    public ResponseEntity<SugarLogResponse> getLogById(
            @AuthenticationPrincipal User user,
            @PathVariable Long id
    ) {
        return ResponseEntity.ok(sugarLogService.getLogById(user, id));
    }

    // ✅ Update log (only if it belongs to current user)
    @PutMapping("/{id}")
    public ResponseEntity<SugarLogResponse> updateLog(
            @AuthenticationPrincipal User user,
            @PathVariable Long id,
            @RequestBody SugarLogRequest request
    ) {
        return ResponseEntity.ok(sugarLogService.updateLog(user, id, request));
    }

    // ✅ Delete log (only if it belongs to current user)
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteLog(
            @AuthenticationPrincipal User user,
            @PathVariable Long id
    ) {
        sugarLogService.deleteLog(user, id);
        return ResponseEntity.noContent().build();
    }
}

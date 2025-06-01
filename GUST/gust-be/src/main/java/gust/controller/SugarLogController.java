package gust.controller;

import gust.dto.SugarLogRequest;
import gust.dto.SugarLogResponse;
import gust.service.SugarLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/sugarlogs")
@RequiredArgsConstructor
public class SugarLogController {

    private final SugarLogService sugarLogService;

    // ✅ Create new log
    @PostMapping
    public ResponseEntity<SugarLogResponse> createLog(@RequestBody SugarLogRequest request) {
        return ResponseEntity.ok(sugarLogService.addLog(request));
    }

    // ✅ Get all logs
    @GetMapping
    public ResponseEntity<List<SugarLogResponse>> getAllLogs() {
        return ResponseEntity.ok(sugarLogService.getAllLogs());
    }

    // ✅ Get logs by date
    @GetMapping("/by-date")
    public ResponseEntity<List<SugarLogResponse>> getLogsByDate(@RequestParam String date) {
        LocalDate parsedDate = LocalDate.parse(date);
        return ResponseEntity.ok(sugarLogService.getLogsByDate(parsedDate));
    }

    // ✅ Get log by ID
    @GetMapping("/{id}")
    public ResponseEntity<SugarLogResponse> getLogById(@PathVariable Long id) {
        return ResponseEntity.ok(sugarLogService.getLogById(id));
    }

    // ✅ Update log
    @PutMapping("/{id}")
    public ResponseEntity<SugarLogResponse> updateLog(@PathVariable Long id,
                                                      @RequestBody SugarLogRequest request) {
        return ResponseEntity.ok(sugarLogService.updateLog(id, request));
    }

    // ✅ Delete log
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteLog(@PathVariable Long id) {
        sugarLogService.deleteLog(id);
        return ResponseEntity.noContent().build();
    }
}

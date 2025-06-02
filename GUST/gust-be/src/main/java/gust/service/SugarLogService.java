package gust.service;

import gust.dto.SugarLogRequest;
import gust.dto.SugarLogResponse;
import gust.mapper.SugarLogMapper;
import gust.model.SugarLog;
import gust.model.User;
import gust.repository.SugarLogRepository;
import gust.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SugarLogService {

    private final SugarLogRepository sugarLogRepository;
    private final SugarLogMapper sugarLogMapper;
    private final UserRepository userRepository;

    // Create log for current user
    public SugarLogResponse addLog(User user, SugarLogRequest request) {
        SugarLog entity = sugarLogMapper.toEntity(request);
        entity.setUser(user);

        SugarLog saved = sugarLogRepository.save(entity);
        return sugarLogMapper.toResponse(saved);
    }

    // Get all logs for current user
    public List<SugarLogResponse> getAllLogs(User user) {
        return sugarLogRepository.findByUserId(user.getId())
                .stream()
                .map(sugarLogMapper::toResponse)
                .collect(Collectors.toList());
    }

    // Get logs by date for current user
    public List<SugarLogResponse> getLogsByDate(User user, LocalDate date) {
        return sugarLogRepository.findByUserIdAndDate(user.getId(), date)
                .stream()
                .map(sugarLogMapper::toResponse)
                .collect(Collectors.toList());
    }

    // Get log by ID for current user only
    public SugarLogResponse getLogById(User user, Long id) {
        SugarLog log = sugarLogRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("SugarLog not found"));
        if (!log.getUser().getId().equals(user.getId())) {
            throw new RuntimeException("Access denied");
        }
        return sugarLogMapper.toResponse(log);
    }

    // Update log (only if it belongs to current user)
    public SugarLogResponse updateLog(User user, Long id, SugarLogRequest request) {
        SugarLog existing = sugarLogRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("SugarLog not found"));
        if (!existing.getUser().getId().equals(user.getId())) {
            throw new RuntimeException("Access denied");
        }

        SugarLog updated = sugarLogMapper.toEntity(request);
        updated.setId(existing.getId());
        updated.setUser(existing.getUser());

        SugarLog saved = sugarLogRepository.save(updated);
        return sugarLogMapper.toResponse(saved);
    }

    // Delete log (only if it belongs to current user)
    public void deleteLog(User user, Long id) {
        SugarLog log = sugarLogRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("SugarLog not found"));
        if (!log.getUser().getId().equals(user.getId())) {
            throw new RuntimeException("Access denied");
        }
        sugarLogRepository.deleteById(id);
    }
}

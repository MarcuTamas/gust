package gust.service;

import gust.dto.SugarLogRequest;
import gust.dto.SugarLogResponse;
import gust.mapper.SugarLogMapper;
import gust.model.SugarLog;
import gust.model.User;
import gust.repository.SugarLogRepository;
import gust.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SugarLogService {

    private final SugarLogRepository sugarLogRepository;
    private final SugarLogMapper sugarLogMapper;
    private final UserRepository userRepository;   // ← inject this

    public SugarLogResponse addLog(SugarLogRequest request) {
        // 1) map incoming DTO to an entity (no user yet)
        SugarLog entity = sugarLogMapper.toEntity(request);

        // 2) get the authenticated principal's username (email)
        String email = SecurityContextHolder.getContext()
                .getAuthentication()
                .getName();

        // 3) load User from DB and attach
        User user = userRepository.findByEmail(email)
                .orElseThrow(() ->
                        new UsernameNotFoundException("User not found: " + email)
                );
        entity.setUser(user);

        // 4) persist
        SugarLog saved = sugarLogRepository.save(entity);
        return sugarLogMapper.toResponse(saved);
    }

    public List<SugarLogResponse> getAllLogs() {
        return sugarLogRepository.findAll()
                .stream()
                .map(sugarLogMapper::toResponse)
                .collect(Collectors.toList());
    }

    public List<SugarLogResponse> getLogsByDate(LocalDate date) {
        return sugarLogRepository.findByDate(date)
                .stream()
                .map(sugarLogMapper::toResponse)
                .collect(Collectors.toList());
    }

    public SugarLogResponse getLogById(Long id) {
        SugarLog log = sugarLogRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("SugarLog not found"));
        return sugarLogMapper.toResponse(log);
    }

    public SugarLogResponse updateLog(Long id, SugarLogRequest request) {
        // you may also want to check author here...
        SugarLog existing = sugarLogRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("SugarLog not found"));

        SugarLog updated = sugarLogMapper.toEntity(request);
        updated.setId(existing.getId());
        // preserve the owner
        updated.setUser(existing.getUser());

        SugarLog saved = sugarLogRepository.save(updated);
        return sugarLogMapper.toResponse(saved);
    }

    public void deleteLog(Long id) {
        if (!sugarLogRepository.existsById(id)) {
            throw new RuntimeException("SugarLog not found");
        }
        sugarLogRepository.deleteById(id);
    }
}

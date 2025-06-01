package gust.controller;

import gust.dto.UserRankingResponse;
import gust.service.CommunityService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

import java.util.List;

@RestController
@RequestMapping("/api/community")
@RequiredArgsConstructor
public class CommunityController {

    private final CommunityService communityService;

    @GetMapping("/rankings")
    public ResponseEntity<List<UserRankingResponse>> getRankings(
            @RequestParam(defaultValue = "monthly") String period
    ) {
        return ResponseEntity.ok(communityService.getRankings(period.toLowerCase()));
    }
}

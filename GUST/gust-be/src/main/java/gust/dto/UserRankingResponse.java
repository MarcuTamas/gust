package gust.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserRankingResponse {
    private String username;
    private int totalSugarGrams;
}

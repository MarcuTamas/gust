package gust.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserRankingResponse {
    private String name;   // <-- full name!
    private int score;
}

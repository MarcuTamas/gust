package gust.dto;

import lombok.Data;

@Data
public class UserProfileUpdateRequest {
    private String fullName;
    private String email;
    private Integer dailySugarGoal;
}

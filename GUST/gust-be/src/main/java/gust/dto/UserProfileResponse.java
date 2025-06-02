package gust.dto;

import gust.model.User;
import lombok.Data;

@Data
public class UserProfileResponse {
    private Long id;
    private String email;
    private String fullName;
    private Integer dailySugarGoal;

    public static UserProfileResponse from(User user) {
        UserProfileResponse dto = new UserProfileResponse();
        dto.setId(user.getId());
        dto.setEmail(user.getEmail());
        dto.setFullName(user.getFullName());
        dto.setDailySugarGoal(user.getDailySugarGoal());
        return dto;
    }
}

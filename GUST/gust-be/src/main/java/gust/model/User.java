package gust.model;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "users")
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor @Builder
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fullName;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    private String role;
    private int streakDays;

    // --- NEW FIELD FOR DAILY SUGAR GOAL ---
    @Column(nullable = false)
    private Integer dailySugarGoal = 75;

    // --- END NEW FIELD ---

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(() -> role);
    }

    /** now returns email, so JWT subject = email and loadUserByUsername(email) lines up */
    @Override
    public String getUsername() {
        return email;
    }

    @Override public String getPassword() { return password; }
    @Override public boolean isAccountNonExpired()  { return true; }
    @Override public boolean isAccountNonLocked()   { return true; }
    @Override public boolean isCredentialsNonExpired() { return true; }
    @Override public boolean isEnabled()            { return true; }

    // --- Getter and Setter for dailySugarGoal (Lombok @Getter/@Setter adds these) ---
    // public Integer getDailySugarGoal() { return dailySugarGoal; }
    // public void setDailySugarGoal(Integer goal) { this.dailySugarGoal = goal; }
}

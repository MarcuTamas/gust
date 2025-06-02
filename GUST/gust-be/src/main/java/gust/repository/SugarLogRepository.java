package gust.repository;

import java.time.LocalDate;
import java.util.List;

import gust.model.SugarLog;
import gust.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SugarLogRepository extends JpaRepository<SugarLog, Long> {
    List<SugarLog> findByDate(LocalDate date);

    List<SugarLog> findByUserOrderByDateDesc(User user);

    List<SugarLog> findByUserOrderByDateAsc(User user);

    List<SugarLog> findByUser(User user);

    List<SugarLog> findByUserAndDate(User user, LocalDate date);

    // For analytics: all logs for user in a month/year
    @Query("""
      select s from SugarLog s
      where s.user = :user
      and month(s.date) = :month
      and year(s.date) = :year
    """)
    List<SugarLog> findByUserAndMonthAndYear(
            @Param("user") User user,
            @Param("month") int month,
            @Param("year") int year);

    // Optional: all logs for a userId (legacy)
    List<SugarLog> findByUserId(Long userId);

    List<SugarLog> findByUserIdAndDate(Long userId, LocalDate date);

    @Query("""
      select distinct s.date
      from SugarLog s
      where s.user = :user
      order by s.date desc
    """)
    List<LocalDate> findAllDistinctDatesByUser(@Param("user") User user);
}

package gust.repository;

import java.time.LocalDate;
import java.util.List;

import gust.model.SugarLog;
import gust.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

// gust.repository.SugarLogRepository
public interface SugarLogRepository extends JpaRepository<SugarLog,Long> {
    List<SugarLog> findByDate(LocalDate date);
    // fetch only the dates (or full entities) for a user, newest-first
    List<SugarLog> findByUserOrderByDateDesc(User user);

    @Query("""
      select distinct s.date
      from SugarLog s
      where s.user = :user
      order by s.date desc
    """)
    List<LocalDate> findAllDistinctDatesByUser(@Param("user") User user);
}
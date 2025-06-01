package gust.mapper;

import gust.dto.SugarLogRequest;
import gust.dto.SugarLogResponse;
import gust.model.Emotion;
import gust.model.SugarLog;
import org.springframework.stereotype.Component;

@Component
public class SugarLogMapper {

    public SugarLog toEntity(SugarLogRequest request) {
        SugarLog log = new SugarLog();
        log.setSugarGrams(request.getSugarGrams());
        log.setDate(request.getDate());
        log.setHour(request.getHour());
        log.setMinute(request.getMinute());
        log.setProductName(request.getProductName());
        log.setSugarType(request.getSugarType());
        log.setContextNote(request.getContextNote());
        log.setEmotion(request.getEmotion());
        log.setLocation(request.getLocation());
        log.setWasCraving(request.isWasCraving());
        return log;
    }

    public SugarLogResponse toResponse(SugarLog entity) {
        SugarLogResponse res = new SugarLogResponse();
        res.setId(entity.getId());
        res.setSugarGrams(entity.getSugarGrams());
        res.setDate(entity.getDate());
        res.setHour(entity.getHour());
        res.setMinute(entity.getMinute());
        res.setProductName(entity.getProductName());
        res.setSugarType(entity.getSugarType());
        res.setContextNote(entity.getContextNote());
        res.setEmotion(entity.getEmotion());
        res.setLocation(entity.getLocation());
        res.setWasCraving(entity.isWasCraving());

        // Optional enrichment
        res.setTimeOfDay(getTimeOfDay(entity.getHour()));
        res.setEmotionLabel(getEmotionLabel(entity.getEmotion()));

        return res;
    }

    private String getTimeOfDay(int hour) {
        if (hour < 12) return "Morning";
        if (hour < 17) return "Afternoon";
        return "Evening";
    }

    private String getEmotionLabel(Emotion emotion) {
        switch (emotion) {
            case SAD: return "Feeling down";
            case STRESSED: return "Under pressure";
            case TIRED: return "Low energy";
            case ANXIOUS: return "Feeling tense";
            case HAPPY: return "Positive mood";
            case BORED: return "Idle state";
            default: return "Neutral mood";
        }
    }
}
